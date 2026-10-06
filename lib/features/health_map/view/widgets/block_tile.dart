import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../models/models.dart';
import '../health_visuals.dart';
import 'mini_house_matrix.dart';

/// One block on the city map. Tinted by risk; blocks that contain an
/// infection cluster get a pulsing cluster-coloured ring.
class BlockTile extends StatelessWidget {
  const BlockTile({
    required this.block,
    required this.summary,
    required this.onTap,
    this.compact = false,
    super.key,
  });

  final CityBlock block;
  final BlockHealthSummary summary;
  final VoidCallback onTap;

  /// Narrow layout: id + matrix only.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final risk = summary.riskLevel;
    final counts = summary.counts;
    final clusterCount = summary.clusters.length;

    final description =
        '${block.name}, ${block.zone}. ${risk.label} risk. '
        '${counts.infected} infected of ${counts.total} houses'
        '${clusterCount > 0 ? ', $clusterCount infection cluster${clusterCount == 1 ? '' : 's'}' : ''}.';

    final tile = Material(
      color: Color.alphaBlend(
        risk.color.withValues(alpha: risk == RiskLevel.low ? 0.06 : 0.14),
        theme.colorScheme.surfaceContainerLowest,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(compact ? 8 : 14),
        side: BorderSide(
          color: risk.color.withValues(alpha: 0.55),
          width: risk.index >= RiskLevel.high.index ? 1.6 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(compact ? 4 : 10),
          child: compact
              ? _CompactContent(block: block, summary: summary)
              : _FullContent(block: block, summary: summary),
        ),
      ),
    );

    return Semantics(
      button: true,
      label: description,
      excludeSemantics: true,
      child: Tooltip(
        message: description,
        waitDuration: const Duration(milliseconds: 400),
        child: summary.hasClusters
            ? _ClusterPulse(radius: compact ? 8 : 14, child: tile)
            : tile,
      ),
    );
  }
}

class _FullContent extends StatelessWidget {
  const _FullContent({required this.block, required this.summary});

  final CityBlock block;
  final BlockHealthSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final clusterCount = summary.clusters.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              block.id,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Flexible(
              child: FittedBox(
                child: RiskBadge(summary.riskLevel, dense: true),
              ),
            ),
          ],
        ),
        Text(
          block.zone,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall?.copyWith(color: muted),
        ),
        const SizedBox(height: 6),
        Expanded(
          child: MiniHouseMatrix(block: block, summary: summary),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(
              Icons.coronavirus_outlined,
              size: 14,
              color: AppColors.infected,
            ),
            const SizedBox(width: 3),
            Text(
              '${summary.counts.infected}',
              style: theme.textTheme.labelSmall,
            ),
            const Spacer(),
            if (clusterCount > 0) ...[
              Icon(
                Icons.hub_outlined,
                size: 14,
                color: AppColors.cluster(theme.brightness),
              ),
              const SizedBox(width: 3),
              Text(
                '$clusterCount',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.cluster(theme.brightness),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _CompactContent extends StatelessWidget {
  const _CompactContent({required this.block, required this.summary});

  final CityBlock block;
  final BlockHealthSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                block.id,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: summary.riskLevel.color,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Expanded(
          child: MiniHouseMatrix(block: block, summary: summary),
        ),
      ],
    );
  }
}

/// Softly pulsing ring around blocks that contain a cluster. Static when the
/// platform asks for reduced motion.
class _ClusterPulse extends StatefulWidget {
  const _ClusterPulse({required this.child, required this.radius});

  final Widget child;
  final double radius;

  @override
  State<_ClusterPulse> createState() => _ClusterPulseState();
}

class _ClusterPulseState extends State<_ClusterPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller
        ..stop()
        ..value = 0.5;
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColors.cluster(Theme.of(context).brightness);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(
              color: color.withValues(alpha: 0.45 + 0.55 * t),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.infected.withValues(alpha: 0.10 + 0.25 * t),
                blurRadius: 4 + 10 * t,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
