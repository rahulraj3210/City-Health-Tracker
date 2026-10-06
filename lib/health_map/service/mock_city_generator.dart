import 'dart:math';

import '../models/models.dart';

/// Builds a deterministic mock city for seeding Firestore and for tests.
///
/// Pure Dart (no Flutter/Firebase imports) so `tool/seed_firestore.dart` can
/// run it with `dart run`. The same [seed] always produces the same city.
class MockCityGenerator {
  MockCityGenerator({
    this.seed = 42,
    this.gridRows = 6,
    this.gridCols = 6,
    this.outbreakCount = 6,
    DateTime? now,
  }) : now = (now ?? DateTime.utc(2026, 10, 6)).toUtc();

  final int seed;
  final int gridRows;
  final int gridCols;

  /// Number of blocks that get an outbreak (guarantees clusters).
  final int outbreakCount;

  /// Size range of each outbreak, in houses.
  static const minOutbreakSize = 4;
  static const maxOutbreakSize = 8;
  final DateTime now;

  static const _zones = [
    'Old Town',
    'Riverside',
    'Market District',
    'Tech Park',
    'Harbor',
    'Greenfield',
  ];
  static const _houseGrids = [(4, 4), (4, 5), (5, 5)];

  List<CityBlock> generate() {
    final rnd = Random(seed);
    final allCells = [
      for (var r = 0; r < gridRows; r++)
        for (var c = 0; c < gridCols; c++) (r, c),
    ]..shuffle(rnd);
    final outbreakCells = allCells.take(outbreakCount).toSet();

    return [
      for (var r = 0; r < gridRows; r++)
        for (var c = 0; c < gridCols; c++)
          _block(rnd, r, c, hasOutbreak: outbreakCells.contains((r, c))),
    ];
  }

  CityBlock _block(Random rnd, int row, int col, {required bool hasOutbreak}) {
    final id = '${String.fromCharCode(65 + row)}${col + 1}';
    final (houseRows, houseCols) = _houseGrids[rnd.nextInt(_houseGrids.length)];

    final outbreak = hasOutbreak
        ? _outbreakCells(rnd, houseRows, houseCols)
        : const <(int, int)>{};
    final statuses = <(int, int), HealthStatus>{
      for (var r = 0; r < houseRows; r++)
        for (var c = 0; c < houseCols; c++)
          (r, c): outbreak.contains((r, c))
              ? _infected(rnd)
              : _sporadicStatus(
                  rnd,
                  // Keep sporadic cases off the outbreak's edge so the
                  // outbreak stays exactly the size it was grown to.
                  allowInfected: !_touches(outbreak, (r, c)),
                ),
    };

    var n = 0;
    final houses = [
      for (var r = 0; r < houseRows; r++)
        for (var c = 0; c < houseCols; c++)
          House(
            id: '$id-H${(++n).toString().padLeft(2, '0')}',
            blockId: id,
            label: '$id-${n.toString().padLeft(2, '0')}',
            row: r,
            col: c,
            occupants: 1 + rnd.nextInt(6),
            status: statuses[(r, c)]!,
            updatedAt: _daysAgo(rnd, 14),
          ),
    ];

    return CityBlock(
      id: id,
      name: 'Block $id',
      zone: _zones[row % _zones.length],
      gridRow: row,
      gridCol: col,
      houseRows: houseRows,
      houseCols: houseCols,
      houses: houses,
    );
  }

  HealthStatus _sporadicStatus(Random rnd, {required bool allowInfected}) {
    final roll = rnd.nextDouble();
    if (roll < 0.04) {
      return allowInfected ? _infected(rnd) : const HealthStatus.healthy();
    }
    if (roll < 0.10) {
      return HealthStatus.suspected(reportedAt: _daysAgo(rnd, 5));
    }
    if (roll < 0.16) {
      return HealthStatus.recovered(recoveredAt: _daysAgo(rnd, 30));
    }
    return const HealthStatus.healthy();
  }

  /// Grows a connected group of [minOutbreakSize]..[maxOutbreakSize] cells
  /// (8-connected, matching the cubit's cluster rule) from a random epicentre.
  Set<(int, int)> _outbreakCells(Random rnd, int rows, int cols) {
    final target = min(
      rows * cols,
      minOutbreakSize + rnd.nextInt(maxOutbreakSize - minOutbreakSize + 1),
    );
    final cells = <(int, int)>{(rnd.nextInt(rows), rnd.nextInt(cols))};
    while (cells.length < target) {
      final candidates =
          <(int, int)>{
              for (final (r, c) in cells)
                for (final (dr, dc) in _neighbourOffsets)
                  if (r + dr >= 0 &&
                      r + dr < rows &&
                      c + dc >= 0 &&
                      c + dc < cols)
                    (r + dr, c + dc),
            }.difference(cells).toList()
            // Sort before picking so the result depends only on the seed.
            ..sort((a, b) => a.$1 != b.$1 ? a.$1 - b.$1 : a.$2 - b.$2);
      cells.add(candidates[rnd.nextInt(candidates.length)]);
    }
    return cells;
  }

  static bool _touches(Set<(int, int)> cells, (int, int) cell) =>
      cells.contains(cell) ||
      _neighbourOffsets.any(
        (d) => cells.contains((cell.$1 + d.$1, cell.$2 + d.$2)),
      );

  static const _neighbourOffsets = [
    (-1, -1),
    (-1, 0),
    (-1, 1),
    (0, -1),
    (0, 1),
    (1, -1),
    (1, 0),
    (1, 1),
  ];

  HealthStatus _infected(Random rnd) {
    final roll = rnd.nextDouble();
    final severity = roll < 0.55
        ? InfectionSeverity.mild
        : roll < 0.85
        ? InfectionSeverity.moderate
        : InfectionSeverity.severe;
    return HealthStatus.infected(
      confirmedAt: _daysAgo(rnd, 10),
      severity: severity,
    );
  }

  DateTime _daysAgo(Random rnd, int maxDays) =>
      now.subtract(Duration(minutes: rnd.nextInt(maxDays * 24 * 60)));
}
