import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_task/core/config/env_loader.dart';
import 'package:movie_app_task/core/config/flavors.dart';
import 'package:movie_app_task/core/di/get_it.dart';

class AppStarter {
  AppStarter._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _initFlavor();
    await EnvLoader.load();
    setupGetIt();
  }

  static void _initFlavor() {
    F.appFlavor = Flavor.values.firstWhere(
      (element) => element.name == appFlavor,
    );
  }
}
