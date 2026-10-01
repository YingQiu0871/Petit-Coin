import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../links.dart';
import '../settings/app_settings.dart';

/// Shown on first launch and whenever the policy version changes.
/// The app stays here until the user agrees.
class ConsentScreen extends StatefulWidget {
  const ConsentScreen({super.key});

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool _declined = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settings = SettingsScope.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(
              // A fresh list per step, so each one starts at the top.
              key: ValueKey(_declined),
              padding: const EdgeInsets.all(24),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      Icons.verified_user_outlined,
                      color: scheme.onPrimaryContainer,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (!_declined) ...[
                  Text(l10n.consentTitle, style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(
                    l10n.consentLead,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (final point in [
                    l10n.consentPointLocation,
                    l10n.consentPointNoSale,
                    l10n.consentPointContrib,
                    l10n.consentPointWithdraw,
                  ])
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check, color: scheme.primary, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              point,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 8),
                  Card.filled(
                    child: SwitchListTile(
                      value: settings.analytics,
                      onChanged: (v) => settings.analytics = v,
                      title: Text(l10n.analytics),
                      subtitle: Text(l10n.optionalOffByDefault),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => launchUrl(Links.privacyPolicy),
                      child: Text(l10n.readPolicy),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: settings.acceptPolicy,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                    ),
                    child: Text(l10n.agreeAndContinue),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => setState(() => _declined = true),
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(l10n.decline),
                  ),
                ] else ...[
                  Text(
                    l10n.declinedTitle,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.declinedBody,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () => setState(() => _declined = false),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                    ),
                    child: Text(l10n.reviewAgain),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
