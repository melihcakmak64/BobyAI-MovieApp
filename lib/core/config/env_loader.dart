import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app_task/core/config/flavors.dart';

class EnvLoader {
  EnvLoader._();

  static Future<void> load() async {
    final flavorFile = switch (F.appFlavor) {
      Flavor.dev => '.env.dev',
      Flavor.staging => '.env.staging',
      Flavor.prod => '.env.prod',
    };

    await dotenv.load(fileName: '.env.common');
    final commonEnv = Map<String, String>.from(dotenv.env);
    await dotenv.load(fileName: flavorFile);

    commonEnv.forEach((key, value) {
      dotenv.env.putIfAbsent(key, () => value);
    });
  }
}
