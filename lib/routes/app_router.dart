import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_task/presentation/view/home/home_screen.dart';
import 'package:movie_app_task/presentation/view/onboarding/genre_selection_screen.dart';
import 'package:movie_app_task/presentation/view/onboarding/movie_selection_screen.dart';
import 'package:movie_app_task/presentation/view/payment/paywall_screen.dart';
import 'package:movie_app_task/presentation/view/splash/splash_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: MovieSelectionRoute.page),
    AutoRoute(page: GenreSelectionRoute.page),
    AutoRoute(page: PaywallRoute.page),
    AutoRoute(page: HomeRoute.page),
  ];
}

final appRouter = AppRouter();
