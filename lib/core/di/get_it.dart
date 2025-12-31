import 'package:get_it/get_it.dart';
import 'package:movie_app_task/presentation/viewmodel/home_view_model.dart';
import 'package:movie_app_task/presentation/viewmodel/movie_view_model.dart';
import 'package:movie_app_task/presentation/viewmodel/paywall_view_model.dart';
import 'package:movie_app_task/routes/app_router.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<MovieViewModel>(MovieViewModel());
    getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<PaywallViewModel>(() => PaywallViewModel());
  getIt.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
