import 'package:ansque/src/services/shared_prefs.dart';
import 'package:ansque/src/shared/locator.dart' as i;

class AppInitializer {
  static Future<void> init() async {

    /// Register dependency injection
    i.registerDependencies();

    await i.locator<SharedPrefs>().init();
  }
}
