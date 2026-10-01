import 'package:material_ui/material_ui.dart';

import 'app.dart';
import 'data/toilet_repository.dart';
import 'settings/app_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = await AppSettings.load();
  runApp(PetitCoinApp(settings: settings, repository: ToiletRepository()));
}
