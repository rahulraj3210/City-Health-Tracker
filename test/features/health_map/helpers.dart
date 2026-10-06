import 'package:city_health_tracker/features/health_map/models/models.dart';

final _t = DateTime.utc(2026, 10, 1);

/// Builds a block from an ASCII grid, one string per row:
/// `.` healthy, `s` suspected, `r` recovered,
/// `x` infected (mild), `m` infected (moderate), `S` infected (severe).
CityBlock blockFromGrid(
  String id,
  List<String> rows, {
  int gridRow = 0,
  int gridCol = 0,
}) {
  final houses = <House>[];
  for (var r = 0; r < rows.length; r++) {
    for (var c = 0; c < rows[r].length; c++) {
      houses.add(
        House(
          id: '$id-r${r}c$c',
          blockId: id,
          label: '$id-$r$c',
          row: r,
          col: c,
          status: _status(rows[r][c]),
          updatedAt: _t.add(Duration(minutes: r * 10 + c)),
        ),
      );
    }
  }
  return CityBlock(
    id: id,
    name: 'Block $id',
    zone: 'Test',
    gridRow: gridRow,
    gridCol: gridCol,
    houseRows: rows.length,
    houseCols: rows.first.length,
    houses: houses,
  );
}

HealthStatus _status(String ch) => switch (ch) {
  '.' => const HealthStatus.healthy(),
  's' => HealthStatus.suspected(reportedAt: _t),
  'r' => HealthStatus.recovered(recoveredAt: _t),
  'x' => HealthStatus.infected(confirmedAt: _t),
  'm' => HealthStatus.infected(
    confirmedAt: _t,
    severity: InfectionSeverity.moderate,
  ),
  'S' => HealthStatus.infected(
    confirmedAt: _t,
    severity: InfectionSeverity.severe,
  ),
  _ => throw ArgumentError('Unknown cell "$ch"'),
};
