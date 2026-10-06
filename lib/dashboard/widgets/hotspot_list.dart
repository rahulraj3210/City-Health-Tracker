import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../health_map/models/models.dart';
import '../../health_map/widgets/health_visuals.dart';

/// Blocks at high or critical risk, most severe first (order comes from the
/// cubit's `hotspotBlockIds`).
class HotspotList extends StatelessWidget {
  const HotspotList({
    required this.snapshot,
    required this.onBlockTap,
    this.maxItems = 6,
    super.key,
  });

  final CityHealthSnapshot snapshot;
  final ValueChanged<CityBlock> onBlockTap;
  final int maxItems;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ids = snapshot.stats.hotspotBlockIds;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text('Hotspots', style: theme.textTheme.titleMedium),
                  const Spacer(),
                  if (ids.length > maxItems)
                    Text(
                      'top $maxItems of ${ids.length}',
                      style: theme.textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            if (ids.isEmpty)
              const ListTile(
                leading: Icon(
                  Icons.verified_outlined,
                  color: AppColors.healthy,
                ),
                title: Text('No hotspots'),
                subtitle: Text('Every block is at low or moderate risk.'),
              ),
            for (final id in ids.take(maxItems))
              if ((snapshot.blockById(id), snapshot.summaryOf(id)) case (
                final block?,
                final summary?,
              ))
                ListTile(
                  onTap: () => onBlockTap(block),
                  leading: CircleAvatar(
                    backgroundColor: summary.riskLevel.color.withValues(
                      alpha: 0.16,
                    ),
                    foregroundColor: readableOnTint(
                      context,
                      summary.riskLevel.color,
                    ),
                    child: Text(
                      block.id,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  title: Text('${block.name} · ${block.zone}'),
                  subtitle: Text(
                    '${summary.counts.infected} infected'
                    '${summary.hasClusters ? ' · ${summary.clusters.length} cluster${summary.clusters.length == 1 ? '' : 's'}' : ''}',
                  ),
                  trailing: RiskBadge(summary.riskLevel, dense: true),
                ),
          ],
        ),
      ),
    );
  }
}
