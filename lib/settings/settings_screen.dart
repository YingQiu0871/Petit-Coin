import 'package:dynamic_color/dynamic_color.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/toilet_repository.dart';
import '../l10n/app_localizations.dart';
import '../links.dart';
import '../theme/palettes.dart';
import 'app_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.repository, this.onSyncNow});

  final ToiletRepository repository;
  final Future<void> Function()? onSyncNow;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  DateTime? _lastSync;
  bool _syncing = false;

  @override
  void initState() {
    super.initState();
    _refreshLastSync();
  }

  Future<void> _refreshLastSync() async {
    final t = await widget.repository.lastSync();
    if (mounted) setState(() => _lastSync = t);
  }

  Future<void> _syncNow() async {
    setState(() => _syncing = true);
    try {
      await widget.onSyncNow?.call();
    } finally {
      await _refreshLastSync();
      if (mounted) setState(() => _syncing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settings = SettingsScope.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context);

    Widget section(String title, List<Widget> children) => Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
            child: Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Card.filled(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Column(children: children),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: DynamicColorBuilder(
        builder: (lightDynamic, _) => ListView(
          children: [
            section(l10n.appearance, [
              SwitchListTile(
                value: settings.dynamicColor && lightDynamic != null,
                onChanged: lightDynamic == null
                    ? null
                    : (v) => settings.dynamicColor = v,
                title: Text(l10n.dynamicColor),
                subtitle: Text(
                  lightDynamic == null
                      ? l10n.dynamicColorUnavailable
                      : l10n.dynamicColorSub,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    l10n.presetPalettes,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 12),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  children: [
                    for (final p in Palette.values)
                      _Swatch(
                        palette: p,
                        label: p.label(l10n),
                        selected:
                            !(settings.dynamicColor && lightDynamic != null) &&
                            settings.palette == p,
                        onTap: () => settings.choosePalette(p),
                      ),
                  ],
                ),
              ),
            ]),
            section(l10n.language, [
              RadioGroup<String>(
                groupValue: settings.localeCode ?? 'system',
                onChanged: (v) =>
                    settings.localeCode = v == 'system' ? null : v,
                child: Column(
                  children: [
                    RadioListTile<String>(
                      value: 'system',
                      title: Text(l10n.followSystem),
                      subtitle: settings.localeCode == null
                          ? Text(_languageName(locale.languageCode))
                          : null,
                    ),
                    for (final code in AppSettings.supportedLocaleCodes)
                      RadioListTile<String>(
                        value: code,
                        title: Text(_languageName(code)),
                      ),
                  ],
                ),
              ),
            ]),
            section(l10n.dataAndUpdates, [
              ListTile(
                title: Text(l10n.lastSync),
                subtitle: Text(
                  _lastSync == null
                      ? l10n.neverSynced
                      : '${MaterialLocalizations.of(context).formatShortDate(_lastSync!)} '
                            '${TimeOfDay.fromDateTime(_lastSync!).format(context)}',
                ),
                trailing: FilledButton.tonal(
                  onPressed: _syncing ? null : _syncNow,
                  child: _syncing
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.syncNow),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  l10n.syncNote,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ]),
            section(l10n.privacy, [
              SwitchListTile(
                value: settings.analytics,
                onChanged: (v) => settings.analytics = v,
                title: Text(l10n.analytics),
                subtitle: Text(l10n.analyticsSub),
              ),
              ListTile(
                title: Text(l10n.readPolicy),
                trailing: const Icon(Icons.open_in_new),
                onTap: () => launchUrl(Links.privacyPolicy),
              ),
              ListTile(
                title: Text(
                  l10n.withdrawConsent,
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                onTap: () {
                  Navigator.of(context).popUntil((r) => r.isFirst);
                  settings.withdrawConsent();
                },
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
              child: TextButton(
                onPressed: () => launchUrl(Links.osmCopyright),
                child: Text(l10n.osmAttribution),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Language names are shown in their own language so anyone can find theirs.
String _languageName(String code) => switch (code) {
  'zh' => '简体中文',
  'fr' => 'Français',
  _ => 'English',
};

class _Swatch extends StatelessWidget {
  const _Swatch({
    required this.palette,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final Palette palette;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      selected: selected,
      button: true,
      label: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: palette.seed,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? scheme.onSurface : Colors.transparent,
                  width: 3,
                ),
              ),
              child: selected
                  ? const Icon(Icons.check, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 6),
            ExcludeSemantics(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
