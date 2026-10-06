import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../models/models.dart';
import 'health_visuals.dart';

/// Thumbnail of a block's house grid: one coloured cell per house, with
/// clustered houses drawn in the cluster colour so outbreaks pop at a glance.
class MiniHouseMatrix extends StatelessWidget {
  const MiniHouseMatrix({
    required this.block,
    required this.summary,
    super.key,
  });

  final CityBlock block;
  final BlockHealthSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomPaint(
      painter: _MiniHouseMatrixPainter(
        block: block,
        summary: summary,
        clusterColor: AppColors.cluster(theme.brightness),
      ),
      size: Size.infinite,
    );
  }
}

class _MiniHouseMatrixPainter extends CustomPainter {
  _MiniHouseMatrixPainter({
    required this.block,
    required this.summary,
    required this.clusterColor,
  });

  final CityBlock block;
  final BlockHealthSummary summary;
  final Color clusterColor;

  @override
  void paint(Canvas canvas, Size size) {
    final rows = block.houseRows, cols = block.houseCols;
    if (rows == 0 || cols == 0 || size.isEmpty) return;

    // Square cells, centred, with gaps proportional to the cell size.
    final step = (size.width / cols).clamp(0, size.height / rows).toDouble();
    final gap = step * 0.18;
    final cell = step - gap;
    final origin = Offset(
      (size.width - step * cols + gap) / 2,
      (size.height - step * rows + gap) / 2,
    );
    final radius = Radius.circular(cell * 0.22);
    final paint = Paint();
    Rect cellRect(House h) => Rect.fromLTWH(
      origin.dx + h.col * step,
      origin.dy + h.row * step,
      cell,
      cell,
    );

    // Halo first: clustered houses get an inflated backdrop that merges
    // with touching neighbours, so a cluster reads as one group while its
    // houses stay infected-red like everywhere else.
    paint.color = clusterColor;
    for (final house in block.houses) {
      if (summary.clusterIdOf(house.id) == null) continue;
      canvas.drawRRect(
        RRect.fromRectAndRadius(cellRect(house).inflate(gap * 0.75), radius),
        paint,
      );
    }

    for (final house in block.houses) {
      paint.color = switch (house.status) {
        HealthyStatus() => house.status.color.withValues(alpha: 0.35),
        _ => house.status.color,
      };
      canvas.drawRRect(RRect.fromRectAndRadius(cellRect(house), radius), paint);
    }
  }

  @override
  bool shouldRepaint(_MiniHouseMatrixPainter old) =>
      old.block != block ||
      old.summary != summary ||
      old.clusterColor != clusterColor;
}
