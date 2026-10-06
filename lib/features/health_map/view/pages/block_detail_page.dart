import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/state_views.dart';
import '../../cubit/city_health_cubit.dart';
import '../../models/models.dart';
import '../health_visuals.dart';
import '../widgets/house_details_sheet.dart';
import '../widgets/house_grid.dart';

/// Houses inside a single city block, with infected houses in red and
/// clusters outlined. Reachable by deep link at `/blocks/:blockId`.
@RoutePage()
class BlockDetailPage extends StatelessWidget {
  const BlockDetailPage({
    @PathParam('blockId') required this.blockId,
    super.key,
  });

  final String blockId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityHealthCubit, CityHealthState>(
      builder: (context, state) {
        final (block, summary) = switch (state) {
          CityHealthLoaded(:final snapshot) => (
            snapshot.blockById(blockId),
            snapshot.summaryOf(blockId),
          ),
          _ => (null, null),
        };

        return Scaffold(
          appBar: AppBar(
            leading: const _BackToDashboardButton(),
            title: Text(block?.name ?? 'Block $blockId'),
            actions: [
              if (summary != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(child: RiskBadge(summary.riskLevel)),
                ),
            ],
          ),
          body: switch (state) {
            CityHealthInitial() || CityHealthLoading() => const LoadingView(),
            CityHealthFailure(:final message) => MessageView(
              icon: Icons.cloud_off_outlined,
              title: 'Could not load this block',
              message: message,
              actionLabel: 'Retry',
              onAction: context.read<CityHealthCubit>().watchCity,
            ),
            CityHealthLoaded() when block == null || summary == null =>
              MessageView(
                icon: Icons.search_off,
                title: 'Block "$blockId" not found',
                message: 'It may have been removed from the city map.',
                actionLabel: 'Back to dashboard',
                onAction: () =>
                    context.router.replaceAll([const DashboardRoute()]),
              ),
            CityHealthLoaded() => _BlockDetailBody(
              block: block!,
              summary: summary!,
            ),
          },
        );
      },
    );
  }
}

class _BackToDashboardButton extends StatelessWidget {
  const _BackToDashboardButton();

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return IconButton(
      tooltip: 'Back to dashboard',
      icon: const Icon(Icons.arrow_back),
      onPressed: () => router.canPop()
          ? router.maybePop()
          : router.replaceAll([const DashboardRoute()]),
    );
  }
}

class _BlockDetailBody extends StatelessWidget {
  const _BlockDetailBody({required this.block, required this.summary});

  final CityBlock block;
  final BlockHealthSummary summary;

  void _openHouse(BuildContext context, House house) =>
      showHouseDetails(context, blockId: block.id, houseId: house.id);

  @override
  Widget build(BuildContext context) {
    final grid = Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
              child: Text(
                '${block.houseRows} × ${block.houseCols} houses · tap a house for details',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            HouseGrid(
              block: block,
              summary: summary,
              onHouseTap: (h) => _openHouse(context, h),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: HealthLegend(),
            ),
          ],
        ),
      ),
    );
    final side = [
      _BlockSummaryCard(block: block, summary: summary),
      const SizedBox(height: 16),
      _ClusterListCard(summary: summary),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 900;
        return SingleChildScrollView(
          padding: EdgeInsets.all(wide ? 24 : 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: wide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: grid),
                        const SizedBox(width: 24),
                        SizedBox(width: 340, child: Column(children: side)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        side.first,
                        const SizedBox(height: 16),
                        grid,
                        ...side.skip(1),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _BlockSummaryCard extends StatelessWidget {
  const _BlockSummaryCard({required this.block, required this.summary});

  final CityBlock block;
  final BlockHealthSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final counts = summary.counts;
    final chips = [
      (HealthStatusKind.healthy, counts.healthy),
      (HealthStatusKind.suspected, counts.suspected),
      (HealthStatusKind.infected, counts.infected),
      (HealthStatusKind.recovered, counts.recovered),
    ];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              block.zone,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${(counts.infectionRate * 100).toStringAsFixed(0)}% infected',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: counts.infected > 0 ? AppColors.infected : null,
              ),
            ),
            Text(
              '${counts.infected} of ${counts.total} houses',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final (status, n) in chips)
                  Chip(
                    visualDensity: VisualDensity.compact,
                    avatar: Icon(status.icon, size: 16, color: status.color),
                    label: Text('${status.label} $n'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ClusterListCard extends StatelessWidget {
  const _ClusterListCard({required this.summary});

  final BlockHealthSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clusterColor = AppColors.cluster(theme.brightness);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Infection clusters',
                style: theme.textTheme.titleMedium,
              ),
            ),
            if (!summary.hasClusters)
              const ListTile(
                leading: Icon(
                  Icons.verified_outlined,
                  color: AppColors.healthy,
                ),
                title: Text('No clusters'),
                subtitle: Text('No group of 3+ touching infected houses.'),
              )
            else
              for (final c in summary.clusters)
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: clusterColor,
                    foregroundColor: theme.brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                    child: Text(
                      shortClusterId(c.id),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  title: Text('${c.size} houses'),
                  subtitle: Text(
                    'Peak severity: ${c.peakSeverity.label} · '
                    'rows ${c.minRow + 1}–${c.maxRow + 1}, cols ${c.minCol + 1}–${c.maxCol + 1}',
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
