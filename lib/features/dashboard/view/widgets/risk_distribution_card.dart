import 'package:flutter/material.dart';

import '../../../health_map/models/models.dart';
import '../../../health_map/view/health_visuals.dart';

/// Stacked bar of how many blocks sit at each risk level.
class RiskDistributionCard extends StatelessWidget {
  const RiskDistributionCard({required this.stats, super.key});

  final CityHealthStats stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final levels = RiskLevel.values.reversed.toList(); // critical first
    final total = stats.totalBlocks;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Block risk levels', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                height: 14,
                child: Row(
                  children: [
                    for (final level in levels)
                      if ((stats.blocksByRisk[level] ?? 0) > 0)
                        Expanded(
                          flex: stats.blocksByRisk[level]!,
                          child: ColoredBox(color: level.color),
                        ),
                    if (total == 0)
                      Expanded(
                        child: ColoredBox(
                          color: theme.colorScheme.outlineVariant,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            for (final level in levels)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: level.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(level.label, style: theme.textTheme.bodyMedium),
                    const Spacer(),
                    Text(
                      '${stats.blocksByRisk[level] ?? 0} blocks',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
