import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/date_format.dart';
import '../blocs/city_health_cubit.dart';
import '../blocs/house_status_cubit.dart';
import '../models/models.dart';
import 'health_visuals.dart';

/// Opens the details/editor sheet for one house. The sheet reads the house
/// live from [CityHealthCubit], so it always reflects the latest data.
Future<void> showHouseDetails(
  BuildContext context, {
  required String blockId,
  required String houseId,
}) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    constraints: const BoxConstraints(maxWidth: 560),
    builder: (_) => HouseDetailsSheet(blockId: blockId, houseId: houseId),
  );
}

class HouseDetailsSheet extends StatefulWidget {
  const HouseDetailsSheet({
    required this.blockId,
    required this.houseId,
    super.key,
  });

  final String blockId;
  final String houseId;

  @override
  State<HouseDetailsSheet> createState() => _HouseDetailsSheetState();
}

class _HouseDetailsSheetState extends State<HouseDetailsSheet> {
  String? _label;

  @override
  void initState() {
    super.initState();
    // Don't show a result left over from a previously opened house.
    context.read<HouseStatusCubit>().reset();
  }

  void _onStatusSaved(BuildContext context, HouseStatusSuccess success) {
    final messenger = ScaffoldMessenger.of(context);
    Navigator.of(context).pop();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          'House ${_label ?? widget.houseId} marked '
          '${success.status.label.toLowerCase()}.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HouseStatusCubit, HouseStatusState>(
      listenWhen: (_, s) =>
          s is HouseStatusSuccess && s.houseId == widget.houseId,
      listener: (context, s) =>
          _onStatusSaved(context, s as HouseStatusSuccess),
      child:
          BlocSelector<
            CityHealthCubit,
            CityHealthState,
            (House?, InfectionCluster?)
          >(
            selector: (state) {
              if (state is! CityHealthLoaded) return (null, null);
              final block = state.snapshot.blockById(widget.blockId);
              final summary = state.snapshot.summaryOf(widget.blockId);
              final house = block?.houses
                  .where((h) => h.id == widget.houseId)
                  .firstOrNull;
              _label = house?.label ?? _label;
              final clusterId = summary?.clusterIdOf(widget.houseId);
              final cluster = summary?.clusters
                  .where((c) => c.id == clusterId)
                  .firstOrNull;
              return (house, cluster);
            },
            builder: (context, selected) => switch (selected) {
              (final house?, final cluster) => SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HouseSummary(house: house, cluster: cluster),
                    const Divider(height: 32),
                    _StatusEditor(house: house),
                  ],
                ),
              ),
              _ => const Padding(
                padding: EdgeInsets.all(32),
                child: Center(
                  child: Text('This house is no longer available.'),
                ),
              ),
            },
          ),
    );
  }
}

class _HouseSummary extends StatelessWidget {
  const _HouseSummary({required this.house, this.cluster});

  final House house;
  final InfectionCluster? cluster;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = house.status;
    final rows = <(IconData, String, String)>[
      (Icons.people_outline, 'Occupants', '${house.occupants}'),
      (
        Icons.grid_on,
        'Position',
        'Row ${house.row + 1}, column ${house.col + 1}',
      ),
      ...switch (status) {
        HealthyStatus() => const <(IconData, String, String)>[],
        SuspectedStatus(:final reportedAt) => [
          (Icons.event, 'Reported', formatDate(reportedAt)),
        ],
        InfectedStatus(:final confirmedAt, :final severity) => [
          (Icons.event, 'Confirmed', formatDate(confirmedAt)),
          (Icons.monitor_heart_outlined, 'Severity', severity.label),
        ],
        RecoveredStatus(:final recoveredAt) => [
          (Icons.event, 'Recovered', formatDate(recoveredAt)),
        ],
      },
      if (house.updatedAt case final updated?)
        (Icons.update, 'Last update', formatRelative(updated)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: status.color.withValues(alpha: 0.15),
              foregroundColor: status.color,
              child: Icon(status.icon),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'House ${house.label}',
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    status.label,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: readableOnTint(context, status.color),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (cluster case final c?) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.infected.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.cluster(theme.brightness)
                    .withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.hub_outlined,
                  color: AppColors.cluster(theme.brightness),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Part of cluster ${shortClusterId(c.id)}: ${c.size} touching '
                    'infected houses (peak ${c.peakSeverity.label.toLowerCase()}).',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 8),
        for (final (icon, label, value) in rows)
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: Icon(icon, size: 20),
            title: Text(label),
            trailing: Text(value, style: theme.textTheme.bodyMedium),
          ),
      ],
    );
  }
}

/// Status picker + save button. Holds only the unsaved selection; saving,
/// no-op detection and status construction live in [HouseStatusCubit].
class _StatusEditor extends StatefulWidget {
  const _StatusEditor({required this.house});

  final House house;

  @override
  State<_StatusEditor> createState() => _StatusEditorState();
}

class _StatusEditorState extends State<_StatusEditor> {
  late HealthStatusKind _kind;
  late InfectionSeverity _severity;

  @override
  void initState() {
    super.initState();
    _syncFromHouse();
  }

  @override
  void didUpdateWidget(_StatusEditor old) {
    super.didUpdateWidget(old);
    // The house changed underneath us (live update): start from its new state.
    if (old.house.status != widget.house.status) _syncFromHouse();
  }

  void _syncFromHouse() {
    _kind = widget.house.status.kind;
    _severity = switch (widget.house.status) {
      InfectedStatus(:final severity) => severity,
      _ => InfectionSeverity.mild,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<HouseStatusCubit>();
    final houseId = widget.house.id;

    return BlocBuilder<HouseStatusCubit, HouseStatusState>(
      buildWhen: (a, b) => _concerns(a, houseId) || _concerns(b, houseId),
      builder: (context, state) {
        final saving = state is HouseStatusSaving && state.houseId == houseId;
        final error = state is HouseStatusFailure && state.houseId == houseId
            ? state.message
            : null;
        final changed = cubit.isChange(
          widget.house,
          _kind,
          severity: _severity,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Update status', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final kind in HealthStatusKind.values)
                  ChoiceChip(
                    key: ValueKey('status-${kind.name}'),
                    avatar: Icon(kind.icon, size: 18, color: kind.color),
                    label: Text(kind.label),
                    selected: _kind == kind,
                    showCheckmark: false,
                    selectedColor: kind.color.withValues(alpha: 0.2),
                    side: BorderSide(
                      color: _kind == kind
                          ? kind.color
                          : theme.colorScheme.outlineVariant,
                    ),
                    onSelected: saving
                        ? null
                        : (_) => setState(() => _kind = kind),
                  ),
              ],
            ),
            if (_kind == HealthStatusKind.infected) ...[
              const SizedBox(height: 16),
              Text('Severity', style: theme.textTheme.labelLarge),
              const SizedBox(height: 8),
              SegmentedButton<InfectionSeverity>(
                segments: [
                  for (final s in InfectionSeverity.values)
                    ButtonSegment(value: s, label: Text(s.label)),
                ],
                selected: {_severity},
                showSelectedIcon: false,
                onSelectionChanged: saving
                    ? null
                    : (s) => setState(() => _severity = s.single),
              ),
            ],
            if (error != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 18,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      error,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            FilledButton.icon(
              key: const ValueKey('save-status'),
              onPressed: changed && !saving
                  ? () => cubit.changeStatus(
                      widget.house,
                      _kind,
                      severity: _severity,
                    )
                  : null,
              icon: saving
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save_outlined),
              label: Text(saving ? 'Saving…' : 'Save status'),
            ),
          ],
        );
      },
    );
  }

  static bool _concerns(HouseStatusState s, String houseId) => switch (s) {
    HouseStatusIdle() => true,
    HouseStatusSaving(houseId: final id) ||
    HouseStatusSuccess(houseId: final id) ||
    HouseStatusFailure(houseId: final id) => id == houseId,
  };
}
