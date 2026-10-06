import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../models/models.dart';
import 'cluster_outline_painter.dart';
import 'house_tile.dart';

/// A block's houses at their row/col positions, with cluster outlines painted
/// underneath so touching infected houses read as one group.
class HouseGrid extends StatelessWidget {
  const HouseGrid({
    required this.block,
    required this.summary,
    required this.onHouseTap,
    super.key,
  });

  final CityBlock block;
  final BlockHealthSummary summary;
  final ValueChanged<House> onHouseTap;

  static const _maxCell = 112.0;

  @override
  Widget build(BuildContext context) {
    final rows = block.houseRows, cols = block.houseCols;
    final housesById = {for (final h in block.houses) h.id: h};
    final clusterCells = [
      for (final cluster in summary.clusters)
        [
          for (final id in cluster.houseIds)
            if (housesById[id] case final h?) (h.row, h.col),
        ],
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Leave room for the outline that bleeds past the outer cells.
        const outerPad = 12.0;
        final gap = constraints.maxWidth < 420 ? 8.0 : 12.0;
        final available = constraints.maxWidth - outerPad * 2;
        final cell = ((available - gap * (cols - 1)) / cols).clamp(
          32.0,
          _maxCell,
        );
        final width = cell * cols + gap * (cols - 1);
        final height = cell * rows + gap * (rows - 1);

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(outerPad),
            child: SizedBox(
              width: width,
              height: height,
              child: CustomPaint(
                painter: ClusterOutlinePainter(
                  clusters: clusterCells,
                  cellSize: cell,
                  gap: gap,
                  color: AppColors.cluster(Theme.of(context).brightness),
                ),
                child: Stack(
                  children: [
                    for (final house in block.houses)
                      Positioned(
                        left: house.col * (cell + gap),
                        top: house.row * (cell + gap),
                        width: cell,
                        height: cell,
                        child: HouseTile(
                          house: house,
                          size: cell,
                          clusterId: summary.clusterIdOf(house.id),
                          onTap: () => onHouseTap(house),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
