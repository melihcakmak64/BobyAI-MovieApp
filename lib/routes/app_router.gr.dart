// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [GenreSelectionScreen]
class GenreSelectionRoute extends PageRouteInfo<void> {
  const GenreSelectionRoute({List<PageRouteInfo>? children})
    : super(GenreSelectionRoute.name, initialChildren: children);

  static const String name = 'GenreSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GenreSelectionScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [MovieSelectionScreen]
class MovieSelectionRoute extends PageRouteInfo<MovieSelectionRouteArgs> {
  MovieSelectionRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        MovieSelectionRoute.name,
        args: MovieSelectionRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'MovieSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieSelectionRouteArgs>(
        orElse: () => const MovieSelectionRouteArgs(),
      );
      return MovieSelectionScreen(key: args.key);
    },
  );
}

class MovieSelectionRouteArgs {
  const MovieSelectionRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MovieSelectionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PaywallScreen]
class PaywallRoute extends PageRouteInfo<void> {
  const PaywallRoute({List<PageRouteInfo>? children})
    : super(PaywallRoute.name, initialChildren: children);

  static const String name = 'PaywallRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return PaywallScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
