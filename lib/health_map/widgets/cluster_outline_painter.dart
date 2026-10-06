import 'package:flutter/material.dart';

/// Paints one merged "blob" per cluster underneath the house tiles: every
/// clustered cell is inflated into the surrounding street gap and unioned
/// with its neighbours (diagonal touches included), so each cluster reads as
/// one connected shape that follows its exact outline.
class ClusterOutlinePainter extends CustomPainter {
  ClusterOutlinePainter({
    required this.clusters,
    required this.cellSize,
    required this.gap,
    required this.color,
  });

  /// Cells (row, col) of each cluster.
  final List<List<(int, int)>> clusters;
  final double cellSize;
  final double gap;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final pad = gap / 2 + 4;
    final step = cellSize + gap;
    final radius = Radius.circular(pad);

    final fill = Paint()..color = color.withValues(alpha: 0.16);
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round;

    for (final cells in clusters) {
      final set = cells.toSet();
      Path? shape;
      void add(Path p) => shape = shape == null
          ? p
          : Path.combine(PathOperation.union, shape!, p);

      for (final (r, c) in cells) {
        final rect = Rect.fromLTWH(
          c * step,
          r * step,
          cellSize,
          cellSize,
        ).inflate(pad);
        add(Path()..addRRect(RRect.fromRectAndRadius(rect, radius)));

        // Fill the street between orthogonal neighbours edge-to-edge so the
        // rounded corners don't leave notches (seams) in the outline.
        if (set.contains((r, c + 1))) {
          add(Path()..addRect(rect.translate(step / 2, 0)));
        }
        if (set.contains((r + 1, c))) {
          add(Path()..addRect(rect.translate(0, step / 2)));
        }

        // Bridge diagonal neighbours through the street intersection.
        for (final dc in const [-1, 1]) {
          if (!set.contains((r + 1, c + dc))) continue;
          final corner = Offset(
            dc > 0 ? (c + 1) * step - gap / 2 : c * step - gap / 2,
            (r + 1) * step - gap / 2,
          );
          add(
            Path()..addRect(
              Rect.fromCenter(
                center: corner,
                width: gap + pad * 2,
                height: gap + pad * 2,
              ),
            ),
          );
        }
      }
      if (shape == null) continue;
      canvas
        ..drawPath(shape!, fill)
        ..drawPath(shape!, stroke);
    }
  }

  @override
  bool shouldRepaint(ClusterOutlinePainter old) =>
      old.cellSize != cellSize ||
      old.gap != gap ||
      old.color != color ||
      !_sameClusters(old.clusters, clusters);

  static bool _sameClusters(
    List<List<(int, int)>> a,
    List<List<(int, int)>> b,
  ) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].length != b[i].length) return false;
      for (var j = 0; j < a[i].length; j++) {
        if (a[i][j] != b[i][j]) return false;
      }
    }
    return true;
  }
}
