import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../health_map/models/models.dart';
import '../../health_map/widgets/health_visuals.dart';

/// Row of headline numbers; reflows from 2 to 3 to 6 columns with width.
class CityStatsOverview extends StatelessWidget {
  const CityStatsOverview({required this.stats, super.key});

  final CityHealthStats stats;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final c = stats.counts;
    final hotspots = stats.hotspotBlockIds.length;
    final cards = [
      (
        Icons.home_work_outlined,
        'Houses',
        '${c.total}',
        '${stats.totalBlocks} blocks',
        Theme.of(context).colorScheme.primary,
      ),
      (
        Icons.coronavirus_outlined,
        'Infected',
        '${c.infected}',
        '${(c.infectionRate * 100).toStringAsFixed(1)}% of houses',
        AppColors.infected,
      ),
      (
        Icons.help_outline,
        'Suspected',
        '${c.suspected}',
        'awaiting confirmation',
        AppColors.suspected,
      ),
      (
        Icons.healing_outlined,
        'Recovered',
        '${c.recovered}',
        'cleared cases',
        AppColors.recovered,
      ),
      (
        Icons.hub_outlined,
        'Clusters',
        '${stats.totalClusters}',
        stats.totalClusters == 0
            ? 'none detected'
            : 'largest: ${stats.largestClusterSize} houses',
        AppColors.cluster(brightness),
      ),
      (
        Icons.local_fire_department_outlined,
        'Hotspots',
        '$hotspots',
        'high or critical risk',
        RiskLevel.high.color,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final cols = w >= 960 ? 6 : (w >= 540 ? 3 : 2);
        const gap = 12.0;
        final cardWidth = (w - gap * (cols - 1)) / cols;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final s in cards)
              SizedBox(width: cardWidth, child: _StatCard(s)),
          ],
        );
      },
    );
  }
}

typedef _Stat = (
  IconData icon,
  String label,
  String value,
  String caption,
  Color color,
);

class _StatCard extends StatelessWidget {
  const _StatCard(this.stat);

  final _Stat stat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (icon, label, value, caption, color) = stat;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 18, color: color),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              caption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
