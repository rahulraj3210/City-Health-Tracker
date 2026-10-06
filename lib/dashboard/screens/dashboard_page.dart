import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/router/app_router.dart';
import '../../core/utils/date_format.dart';
import '../../core/widgets/state_views.dart';
import '../../health_map/blocs/city_health_cubit.dart';
import '../../health_map/models/models.dart';
import '../../health_map/widgets/health_visuals.dart';
import '../../health_map/widgets/city_block_grid.dart';
import '../widgets/city_stats_overview.dart';
import '../widgets/hotspot_list.dart';
import '../widgets/risk_distribution_card.dart';

/// City-wide health dashboard: headline stats, the interactive block map,
/// hotspots and the risk distribution. Live-updates from [CityHealthCubit].
@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CityHealthCubit, CityHealthState>(
          builder: (context, state) => switch (state) {
            CityHealthInitial() || CityHealthLoading() => const LoadingView(),
            CityHealthFailure(:final message) => MessageView(
              icon: Icons.cloud_off_outlined,
              title: 'Could not load city health data',
              message: message,
              actionLabel: 'Retry',
              onAction: context.read<CityHealthCubit>().watchCity,
            ),
            CityHealthLoaded(:final snapshot) when snapshot.blocks.isEmpty =>
              const MessageView(
                icon: Icons.location_city_outlined,
                title: 'No city data yet',
                message: 'Seed Firestore with `fvm dart run tool/seed_firestore.dart`.',
              ),
            CityHealthLoaded(:final snapshot) => _DashboardBody(
              snapshot: snapshot,
            ),
          },
        ),
      ),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({required this.snapshot});

  final CityHealthSnapshot snapshot;

  void _openBlock(BuildContext context, CityBlock block) =>
      context.router.push(BlockDetailRoute(blockId: block.id));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final map = Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text('City map', style: theme.textTheme.titleMedium),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tap a block to see its houses',
                    textAlign: TextAlign.end,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CityBlockGrid(
              snapshot: snapshot,
              onBlockTap: (b) => _openBlock(context, b),
            ),
            const SizedBox(height: 12),
            const HealthLegend(),
          ],
        ),
      ),
    );
    final hotspots = HotspotList(
      snapshot: snapshot,
      onBlockTap: (b) => _openBlock(context, b),
    );
    final risk = RiskDistributionCard(stats: snapshot.stats);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final wide = width >= 1100;
        final medium = width >= 700;
        const gap = 16.0;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: medium ? 24 : 16,
            vertical: medium ? 24 : 16,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Header(stats: snapshot.stats),
                  const SizedBox(height: 20),
                  CityStatsOverview(stats: snapshot.stats),
                  const SizedBox(height: gap),
                  if (wide)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: map),
                        const SizedBox(width: gap),
                        SizedBox(
                          width: 380,
                          child: Column(
                            children: [
                              hotspots,
                              const SizedBox(height: gap),
                              risk,
                            ],
                          ),
                        ),
                      ],
                    )
                  else ...[
                    map,
                    const SizedBox(height: gap),
                    if (medium)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: hotspots),
                          const SizedBox(width: gap),
                          Expanded(child: risk),
                        ],
                      )
                    else ...[
                      hotspots,
                      const SizedBox(height: gap),
                      risk,
                    ],
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.stats});

  final CityHealthStats stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final updated = stats.lastUpdated;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            Icons.health_and_safety_outlined,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'City Health Tracker',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                [
                  'Live overview of ${stats.totalBlocks} blocks',
                  if (updated != null) 'last report ${formatRelative(updated)}',
                ].join(' · '),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
