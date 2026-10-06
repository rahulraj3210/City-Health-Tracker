import 'package:flutter/material.dart';

import '../models/models.dart';
import 'block_tile.dart';

/// The city map: blocks laid out at their real grid positions, separated by
/// "streets". Always fits the available width; tiles switch to a compact
/// rendering when they get small.
class CityBlockGrid extends StatelessWidget {
  const CityBlockGrid({
    required this.snapshot,
    required this.onBlockTap,
    super.key,
  });

  final CityHealthSnapshot snapshot;
  final ValueChanged<CityBlock> onBlockTap;

  static const _compactBelow = 112.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rows = snapshot.gridRows, cols = snapshot.gridCols;
    final byCell = {for (final b in snapshot.blocks) (b.gridRow, b.gridCol): b};

    return LayoutBuilder(
      builder: (context, constraints) {
        final street = constraints.maxWidth < 500 ? 5.0 : 10.0;
        final tile = (constraints.maxWidth - street * (cols + 1)) / cols;
        final compact = tile < _compactBelow;

        return Container(
          padding: EdgeInsets.all(street),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              for (var r = 0; r < rows; r++) ...[
                if (r > 0) SizedBox(height: street),
                Row(
                  children: [
                    for (var c = 0; c < cols; c++) ...[
                      if (c > 0) SizedBox(width: street),
                      SizedBox.square(
                        dimension: tile,
                        child: switch (byCell[(r, c)]) {
                          final block? => BlockTile(
                            key: ValueKey('block-${block.id}'),
                            block: block,
                            summary: snapshot.summaryOf(block.id)!,
                            compact: compact,
                            onTap: () => onBlockTap(block),
                          ),
                          null => const SizedBox.shrink(),
                        },
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
