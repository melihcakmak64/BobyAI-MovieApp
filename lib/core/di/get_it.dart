import 'package:get_it/get_it.dart';
import 'package:movie_app_task/viewmodel/home_view_model.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';
import 'package:movie_app_task/viewmodel/paywall_view_model.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<MovieViewModel>(MovieViewModel());
  getIt.registerLazySingleton<PaywallViewModel>(() => PaywallViewModel());
  getIt.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
