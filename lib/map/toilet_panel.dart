import 'package:material_ui/material_ui.dart';
import 'package:maplibre_gl/maplibre_gl.dart' show LatLng;

import '../data/opening_hours.dart';
import '../data/toilet.dart';
import '../l10n/app_localizations.dart';

/// Bottom panel: the nearest toilets, or details of the selected one.
class ToiletPanel extends StatelessWidget {
  const ToiletPanel({
    super.key,
    required this.toilets,
    required this.selected,
    required this.here,
    required this.loading,
    required this.failed,
    required this.onSelect,
    required this.onRetry,
    required this.onDirections,
  });

  final List<Toilet> toilets;
  final Toilet? selected;
  final LatLng here;
  final bool loading;
  final bool failed;
  final ValueChanged<Toilet?> onSelect;
  final VoidCallback onRetry;
  final ValueChanged<Toilet> onDirections;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            width: 32,
            height: 4,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: scheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          child: selected == null
              ? _list(context)
              : _detail(context, selected!),
        ),
      ],
    );
  }

  int _meters(Toilet t) => t.distanceTo(here.latitude, here.longitude).round();

  String _distance(Toilet t) {
    final m = _meters(t);
    return m < 1000 ? '$m m' : '${(m / 1000).toStringAsFixed(1)} km';
  }

  Widget _list(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Text(l10n.nearby, style: theme.textTheme.titleLarge),
            ),
            if (loading)
              const SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Text(
                l10n.resultCount(toilets.length),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (failed)
          Row(
            children: [
              Expanded(child: Text(l10n.loadError)),
              TextButton(onPressed: onRetry, child: Text(l10n.retry)),
            ],
          )
        else if (!loading && toilets.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              l10n.noResults,
              style: TextStyle(color: scheme.onSurfaceVariant),
            ),
          ),
        for (final t in toilets.take(3))
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Material(
              color: scheme.onSurface.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(18),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onTap: () => onSelect(t),
                leading: CircleAvatar(
                  backgroundColor: scheme.primary,
                  foregroundColor: scheme.onPrimary,
                  child: const Icon(Icons.wc, size: 20),
                ),
                title: Text(
                  t.name ?? l10n.unnamedToilet,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(_summary(l10n, t)),
                trailing: Text(
                  _distance(t),
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: scheme.primary,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _summary(AppLocalizations l10n, Toilet t) {
    final open = switch (openStateAt(t.openingHours, DateTime.now())) {
      OpenState.open => l10n.openNow,
      OpenState.closed => l10n.closedNow,
      OpenState.unknown => l10n.hoursUnknown,
    };
    final fee = switch (t.fee) {
      false => ' · ${l10n.filterFree}',
      true => ' · ${l10n.paid}',
      null => '',
    };
    return '$open$fee';
  }

  Widget _detail(BuildContext context, Toilet t) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final state = openStateAt(t.openingHours, DateTime.now());
    final minutes = (_meters(t) / 80).ceil().clamp(1, 999);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                t.name ?? l10n.unnamedToilet,
                style: theme.textTheme.titleLarge,
              ),
            ),
            IconButton.filledTonal(
              tooltip: l10n.close,
              onPressed: () => onSelect(null),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (state != OpenState.unknown)
              Chip(
                label: Text(
                  state == OpenState.open ? l10n.openNow : l10n.closedNow,
                ),
                backgroundColor: state == OpenState.open
                    ? scheme.primaryContainer
                    : scheme.errorContainer,
                side: BorderSide.none,
              ),
            Text(
              t.openingHours == null
                  ? l10n.hoursUnknown
                  : '${l10n.hours} ${t.openingHours}',
            ),
            Text(
              l10n.walkMinutes(minutes),
              style: TextStyle(
                color: scheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (t.fee != null) _Tag(t.isFree ? l10n.filterFree : l10n.paid),
            if (t.isAccessible) _Tag(l10n.filterAccessible),
            if (t.hasChangingTable) _Tag(l10n.filterBabyChange),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          l10n.sourceLine(t.source),
          style: theme.textTheme.bodySmall?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                ),
                onPressed: () => onDirections(t),
                icon: const Icon(Icons.directions_walk),
                label: Text(l10n.directions),
              ),
            ),
            const SizedBox(width: 10),
            FilledButton.tonal(
              style: FilledButton.styleFrom(minimumSize: const Size(0, 52)),
              // Reporting needs the contribution backend; wired up later.
              onPressed: null,
              child: Text(l10n.report),
            ),
          ],
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: scheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
