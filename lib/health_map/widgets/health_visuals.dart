import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../models/models.dart';

/// Presentation mapping for health states — colours, labels, icons only.
extension HealthStatusKindVisuals on HealthStatusKind {
  Color get color => switch (this) {
    HealthStatusKind.healthy => AppColors.healthy,
    HealthStatusKind.suspected => AppColors.suspected,
    HealthStatusKind.infected => AppColors.infected,
    HealthStatusKind.recovered => AppColors.recovered,
  };

  String get label => switch (this) {
    HealthStatusKind.healthy => 'Healthy',
    HealthStatusKind.suspected => 'Suspected',
    HealthStatusKind.infected => 'Infected',
    HealthStatusKind.recovered => 'Recovered',
  };

  IconData get icon => switch (this) {
    HealthStatusKind.healthy => Icons.check_circle_outline,
    HealthStatusKind.suspected => Icons.help_outline,
    HealthStatusKind.infected => Icons.coronavirus_outlined,
    HealthStatusKind.recovered => Icons.healing_outlined,
  };
}

extension HealthStatusVisuals on HealthStatus {
  Color get color => kind.color;
  String get label => kind.label;
  IconData get icon => kind.icon;
}

extension InfectionSeverityVisuals on InfectionSeverity {
  String get label => switch (this) {
    InfectionSeverity.mild => 'Mild',
    InfectionSeverity.moderate => 'Moderate',
    InfectionSeverity.severe => 'Severe',
  };
}

extension RiskLevelVisuals on RiskLevel {
  Color get color => switch (this) {
    RiskLevel.low => AppColors.riskLow,
    RiskLevel.moderate => AppColors.riskModerate,
    RiskLevel.high => AppColors.riskHigh,
    RiskLevel.critical => AppColors.riskCritical,
  };

  String get label => switch (this) {
    RiskLevel.low => 'Low',
    RiskLevel.moderate => 'Moderate',
    RiskLevel.high => 'High',
    RiskLevel.critical => 'Critical',
  };
}

/// Short display id of a cluster, e.g. `D3-C1` -> `C1`.
String shortClusterId(String clusterId) => clusterId.split('-').last;

/// Small pill showing a block's risk level.
class RiskBadge extends StatelessWidget {
  const RiskBadge(this.level, {this.dense = false, super.key});

  final RiskLevel level;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final color = level.color;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 6 : 10,
        vertical: dense ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.6)),
      ),
      child: Text(
        dense ? level.label : '${level.label} risk',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: readableOnTint(context, color),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Legend explaining the house colours and the cluster outline.
class HealthLegend extends StatelessWidget {
  const HealthLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = [for (final k in HealthStatusKind.values) (k.color, k.label)];
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final (color, label) in items)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 6),
              Text(label, style: theme.textTheme.bodySmall),
            ],
          ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.infected,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: AppColors.cluster(theme.brightness),
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text('Cluster (3+ touching)', style: theme.textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}

/// Picks a readable text colour for content drawn on a light tint of [color].
Color readableOnTint(BuildContext context, Color color) {
  final dark = Theme.of(context).brightness == Brightness.dark;
  final hsl = HSLColor.fromColor(color);
  return hsl
      .withLightness(dark ? 0.78 : (hsl.lightness * 0.6).clamp(0.2, 0.4))
      .toColor();
}
