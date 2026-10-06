import 'package:city_health_tracker/health_map/models/models.dart';
import 'package:city_health_tracker/health_map/service/city_health_service.dart';
import 'package:city_health_tracker/health_map/service/firestore_city_health_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeFirebaseFirestore db;
  late FirestoreCityHealthService service;
  final seededAt = DateTime.utc(2026, 9, 1);

  setUp(() async {
    db = FakeFirebaseFirestore();
    service = FirestoreCityHealthService(firestore: db);
    await db.doc('blocks/A1').set({
      'name': 'Block A1',
      'zone': 'Old Town',
      'gridRow': 0,
      'gridCol': 0,
      'houseRows': 1,
      'houseCols': 2,
    });
    for (final (i, status) in [
      {'type': 'healthy'},
      {'type': 'infected', 'confirmedAt': Timestamp.fromDate(seededAt)},
    ].indexed) {
      await db.doc('blocks/A1/houses/A1-H0${i + 1}').set({
        'label': 'A1-0${i + 1}',
        'row': 0,
        'col': i,
        'occupants': 2,
        'status': status,
        'updatedAt': Timestamp.fromDate(seededAt),
      });
    }
  });

  test(
    'watchCity attaches houses to their block and parses timestamps',
    () async {
      final blocks = await service.watchCity().first;
      expect(blocks.single.id, 'A1');
      final houses = blocks.single.houses;
      expect(houses.map((h) => h.blockId).toSet(), {'A1'});
      expect(
        houses.firstWhere((h) => h.id == 'A1-H02').status,
        HealthStatus.infected(confirmedAt: seededAt),
      );
    },
  );

  test('updateHouseStatus writes only status (with real Timestamps) and a '
      'server updatedAt', () async {
    final confirmedAt = DateTime.utc(2026, 10, 6, 9, 30);
    await service.updateHouseStatus(
      blockId: 'A1',
      houseId: 'A1-H01',
      status: HealthStatus.infected(
        confirmedAt: confirmedAt,
        severity: InfectionSeverity.severe,
      ),
    );

    final data = (await db.doc('blocks/A1/houses/A1-H01').get()).data()!;
    expect(data['status'], {
      'type': 'infected',
      'confirmedAt': Timestamp.fromDate(confirmedAt),
      'severity': 'severe',
    });
    expect(data['updatedAt'], isA<Timestamp>());
    expect(
      (data['updatedAt'] as Timestamp).toDate().isAfter(seededAt),
      isTrue,
      reason: 'server timestamp replaces the old value',
    );
    // Everything else is untouched.
    expect(data['label'], 'A1-01');
    expect(data['occupants'], 2);
  });

  // Note: fake_cloud_firestore does not re-emit collection-group snapshots
  // after an update (real Firestore does), so this re-reads instead of
  // listening. Live propagation is verified against the real backend.
  test('a written status reads back through watchCity', () async {
    final recoveredAt = DateTime.utc(2026, 10, 6);
    await service.updateHouseStatus(
      blockId: 'A1',
      houseId: 'A1-H02',
      status: HealthStatus.recovered(recoveredAt: recoveredAt),
    );
    final blocks = await service.watchCity().first;
    final house = blocks.single.houses.firstWhere((h) => h.id == 'A1-H02');
    expect(house.status, HealthStatus.recovered(recoveredAt: recoveredAt));
    expect(house.updatedAt, isNotNull);
  });

  test('updating a missing house throws a service exception', () async {
    expect(
      () => service.updateHouseStatus(
        blockId: 'A1',
        houseId: 'NOPE',
        status: const HealthStatus.healthy(),
      ),
      throwsA(isA<CityHealthServiceException>()),
    );
  });
}
