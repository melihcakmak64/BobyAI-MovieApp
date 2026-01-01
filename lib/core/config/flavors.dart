enum Flavor { dev, staging, prod }

class F {
  static late final Flavor appFlavor;

  static bool get isDev => appFlavor == Flavor.dev;
  static bool get isStaging => appFlavor == Flavor.staging;
  static bool get isProd => appFlavor == Flavor.prod;
}
