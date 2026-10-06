import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:city_health_tracker/core/router/app_router.dart';
import 'package:city_health_tracker/core/theme/app_colors.dart';
import 'package:city_health_tracker/core/theme/app_theme.dart';
import 'package:city_health_tracker/health_map/blocs/city_health_cubit.dart';
import 'package:city_health_tracker/health_map/blocs/house_status_cubit.dart';
import 'package:city_health_tracker/health_map/models/models.dart';
import 'package:city_health_tracker/health_map/service/city_health_service.dart';
import 'package:city_health_tracker/health_map/service/mock_city_generator.dart';
import 'package:city_health_tracker/health_map/widgets/block_tile.dart';
import 'package:city_health_tracker/health_map/widgets/cluster_outline_painter.dart';
import 'package:city_health_tracker/health_map/widgets/house_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCubit extends MockCubit<CityHealthState>
    implements CityHealthCubit {}

class _MockStatusCubit extends MockCubit<HouseStatusState>
    implements HouseStatusCubit {}

class _MockService extends Mock implements CityHealthService {}

const fallbackHouse = House(id: 'x', blockId: 'x', label: 'x', row: 0, col: 0);

void main() {
  late _MockCubit cubit;
  late _MockStatusCubit statusCubit;
  late StreamController<HouseStatusState> statusStates;
  late CityHealthSnapshot snapshot;
  late AppRouter router;

  setUpAll(() {
    registerFallbackValue(fallbackHouse);
    registerFallbackValue(HealthStatusKind.healthy);
    registerFallbackValue(InfectionSeverity.mild);
    final builder = CityHealthCubit(_MockService());
    snapshot = builder.buildSnapshot(MockCityGenerator().generate());
    builder.close();
  });

  setUp(() {
    cubit = _MockCubit();
    router = AppRouter();
    statusStates = StreamController<HouseStatusState>.broadcast();
    statusCubit = _MockStatusCubit();
    // Real no-op detection, so the Save button enables exactly as in the app.
    final logic = HouseStatusCubit(_MockService());
    addTearDown(logic.close);
    when(
      () =>
          statusCubit.isChange(any(), any(), severity: any(named: 'severity')),
    ).thenAnswer(
      (i) => logic.isChange(
        i.positionalArguments[0] as House,
        i.positionalArguments[1] as HealthStatusKind,
        severity: i.namedArguments[#severity] as InfectionSeverity,
      ),
    );
    when(
      () => statusCubit.changeStatus(
        any(),
        any(),
        severity: any(named: 'severity'),
      ),
    ).thenAnswer((_) async {});
  });

  tearDown(() => statusStates.close());

  Future<void> pumpApp(
    WidgetTester tester, {
    required CityHealthState state,
    Size size = const Size(1440, 1000),
    String? initialPath,
  }) async {
    tester.view
      ..physicalSize = size
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    // The cluster pulse loops forever; reduced motion makes it static.
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);

    whenListen(
      cubit,
      const Stream<CityHealthState>.empty(),
      initialState: state,
    );
    whenListen(
      statusCubit,
      statusStates.stream,
      initialState: const HouseStatusState.idle(),
    );
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<CityHealthCubit>.value(value: cubit),
          BlocProvider<HouseStatusCubit>.value(value: statusCubit),
        ],
        child: MaterialApp.router(
          theme: AppTheme.light,
          routerConfig: router.config(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    if (initialPath != null) {
      router.navigatePath(initialPath);
      await tester.pumpAndSettle();
    }
  }

  String clusteredBlockId() => snapshot.stats.hotspotBlockIds.firstWhere(
    (id) => snapshot.summaryOf(id)!.hasClusters,
  );

  for (final (name, size) in [
    ('phone', const Size(390, 844)),
    ('tablet', const Size(820, 1180)),
    ('desktop', const Size(1440, 1000)),
  ]) {
    testWidgets('dashboard renders every block without overflow on $name', (
      tester,
    ) async {
      await pumpApp(
        tester,
        state: CityHealthState.loaded(snapshot),
        size: size,
      );

      expect(find.text('City Health Tracker'), findsOneWidget);
      expect(find.byType(BlockTile), findsNWidgets(36));
      expect(find.text('${snapshot.stats.counts.infected}'), findsWidgets);
      expect(find.text('Hotspots'), findsWidgets);
    });
  }

  testWidgets('tapping a block shows its houses with infected in red and '
      'clusters outlined', (tester) async {
    await pumpApp(tester, state: CityHealthState.loaded(snapshot));
    final id = clusteredBlockId();
    final block = snapshot.blockById(id)!;
    final summary = snapshot.summaryOf(id)!;

    await tester.tap(find.byKey(ValueKey('block-$id')));
    await tester.pumpAndSettle();

    expect(router.currentPath, '/blocks/$id');
    expect(find.text(block.name), findsOneWidget);
    expect(find.byType(HouseTile), findsNWidgets(block.houses.length));

    // Infected houses are solid red; others are not.
    for (final house in block.houses) {
      final material = tester.widget<Material>(
        find.byKey(ValueKey('house-${house.id}')),
      );
      expect(
        material.color == AppColors.infected,
        house.isInfected,
        reason: house.id,
      );
    }

    // Every clustered house carries its cluster tag, and the outline
    // painter receives exactly the cubit's clusters.
    final clustered = summary.clusters.expand((c) => c.houseIds).length;
    expect(find.text('C1'), findsAtLeastNWidgets(summary.clusters.first.size));
    final painter = tester
        .widgetList<CustomPaint>(find.byType(CustomPaint))
        .map((p) => p.painter)
        .whereType<ClusterOutlinePainter>()
        .single;
    expect(painter.clusters.expand((c) => c).length, clustered);
  });

  testWidgets('tapping a clustered house explains the cluster', (tester) async {
    final id = clusteredBlockId();
    await pumpApp(
      tester,
      state: CityHealthState.loaded(snapshot),
      initialPath: '/blocks/$id',
    );
    final cluster = snapshot.summaryOf(id)!.clusters.first;

    await tester.tap(find.byKey(ValueKey('house-${cluster.houseIds.first}')));
    await tester.pumpAndSettle();

    expect(find.textContaining('Part of cluster C1'), findsOneWidget);
    expect(find.text('Infected'), findsWidgets);
  });

  testWidgets('deep link to a block works on a phone and back returns home', (
    tester,
  ) async {
    await pumpApp(
      tester,
      state: CityHealthState.loaded(snapshot),
      size: const Size(390, 844),
      initialPath: '/blocks/A1',
    );
    expect(find.text('Block A1'), findsOneWidget);

    await tester.tap(find.byTooltip('Back to dashboard'));
    await tester.pumpAndSettle();
    expect(router.currentPath, '/');
  });

  testWidgets('unknown block shows not-found', (tester) async {
    await pumpApp(
      tester,
      state: CityHealthState.loaded(snapshot),
      initialPath: '/blocks/Z9',
    );
    expect(find.text('Block "Z9" not found'), findsOneWidget);
  });

  testWidgets('failure state offers retry through the cubit', (tester) async {
    await pumpApp(tester, state: const CityHealthState.failure('Offline'));
    expect(find.text('Offline'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    verify(() => cubit.watchCity()).called(1);
  });

  testWidgets('loading state shows a spinner', (tester) async {
    tester.view.physicalSize = const Size(800, 600);
    addTearDown(tester.view.reset);
    whenListen(
      cubit,
      const Stream<CityHealthState>.empty(),
      initialState: const CityHealthState.loading(),
    );
    await tester.pumpWidget(
      BlocProvider<CityHealthCubit>.value(
        value: cubit,
        child: MaterialApp.router(routerConfig: router.config()),
      ),
    );
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  group('status editing', () {
    Future<House> openHealthyHouse(WidgetTester tester) async {
      final block = snapshot.blockById('A1')!;
      final house = block.houses.firstWhere((h) => h.status is HealthyStatus);
      await pumpApp(
        tester,
        state: CityHealthState.loaded(snapshot),
        initialPath: '/blocks/A1',
      );
      await tester.tap(find.byKey(ValueKey('house-${house.id}')));
      await tester.pumpAndSettle();
      return house;
    }

    ButtonStyleButton saveButton(WidgetTester tester) => tester
        .widget<ButtonStyleButton>(find.byKey(const ValueKey('save-status')));

    testWidgets('Save is disabled until a different status is picked', (
      tester,
    ) async {
      await openHealthyHouse(tester);
      expect(find.text('Update status'), findsOneWidget);
      expect(saveButton(tester).onPressed, isNull);

      await tester.tap(find.byKey(const ValueKey('status-recovered')));
      await tester.pump();
      expect(saveButton(tester).onPressed, isNotNull);
    });

    testWidgets('marking a house infected sends kind and severity to the '
        'cubit', (tester) async {
      final house = await openHealthyHouse(tester);

      await tester.tap(find.byKey(const ValueKey('status-infected')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Severe'));
      await tester.pump();
      await tester.ensureVisible(find.byKey(const ValueKey('save-status')));
      await tester.tap(find.byKey(const ValueKey('save-status')));
      await tester.pump();

      verify(
        () => statusCubit.changeStatus(
          house,
          HealthStatusKind.infected,
          severity: InfectionSeverity.severe,
        ),
      ).called(1);
    });

    testWidgets('success closes the sheet and confirms with a snackbar', (
      tester,
    ) async {
      final house = await openHealthyHouse(tester);
      final recovered = HealthStatus.recovered(
        recoveredAt: DateTime.utc(2026, 10, 6),
      );

      statusStates.add(
        HouseStatusState.saving(houseId: house.id, status: recovered),
      );
      await tester.pump();
      await tester.pump(); // the event lands mid-frame; rebuild next frame
      expect(find.text('Saving…'), findsOneWidget);

      statusStates.add(
        HouseStatusState.success(houseId: house.id, status: recovered),
      );
      await tester.pumpAndSettle();
      expect(find.text('Update status'), findsNothing);
      expect(
        find.text('House ${house.label} marked recovered.'),
        findsOneWidget,
      );
    });

    testWidgets('failure keeps the sheet open and shows the reason', (
      tester,
    ) async {
      final house = await openHealthyHouse(tester);
      statusStates.add(
        HouseStatusState.failure(
          houseId: house.id,
          message: 'The server rejected this change.',
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Update status'), findsOneWidget);
      expect(find.text('The server rejected this change.'), findsOneWidget);
    });

    testWidgets('results for other houses are ignored', (tester) async {
      await openHealthyHouse(tester);
      statusStates.add(
        const HouseStatusState.failure(houseId: 'F6-H01', message: 'nope'),
      );
      await tester.pumpAndSettle();
      expect(find.text('nope'), findsNothing);
    });
  });
}
