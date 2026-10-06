import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../models/models.dart';
import '../health_visuals.dart';

/// A single house. Infected houses are solid red; other states are tinted.
/// Clustered houses carry a cluster tag (e.g. "C1").
class HouseTile extends StatelessWidget {
  const HouseTile({
    required this.house,
    required this.size,
    required this.onTap,
    this.clusterId,
    super.key,
  });

  final House house;
  final double size;
  final String? clusterId;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = house.status;
    final infected = status.isInfected;
    final color = status.color;
    final fg = infected ? Colors.white : readableOnTint(context, color);
    final compact = size < 72;
    final number = house.label.split('-').last;

    final semantics =
        'House ${house.label}, ${status.label}'
        '${clusterId != null ? ', part of cluster ${shortClusterId(clusterId!)}' : ''}';

    return Semantics(
      button: true,
      label: semantics,
      excludeSemantics: true,
      child: Material(
        key: ValueKey('house-${house.id}'),
        color: infected
            ? color
            : Color.alphaBlend(
                color.withValues(alpha: 0.14),
                theme.colorScheme.surfaceContainerLowest,
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size * 0.16),
          side: BorderSide(
            color: infected ? color : color.withValues(alpha: 0.5),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: infected ? 2 : 0,
        shadowColor: AppColors.infected,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          infected ? Icons.coronavirus : Icons.home_rounded,
                          color: fg,
                          size: 22,
                        ),
                        Text(
                          number,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: fg,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        if (!compact)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.person_outline, size: 11, color: fg),
                              Text(
                                '${house.occupants}',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: fg,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (clusterId != null)
                Positioned(
                  top: 3,
                  right: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cluster(Brightness.light),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      shortClusterId(clusterId!),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
