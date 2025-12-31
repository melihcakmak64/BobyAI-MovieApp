import 'package:get_it/get_it.dart';
import 'package:movie_app_task/data/repository/movie_repository.dart';
import 'package:movie_app_task/data/repository/subscription_repository.dart';
import 'package:movie_app_task/presentation/viewmodel/home_view_model.dart';
import 'package:movie_app_task/presentation/viewmodel/movie_view_model.dart';
import 'package:movie_app_task/presentation/viewmodel/paywall_view_model.dart';
import 'package:movie_app_task/routes/app_router.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepository());
  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepository(),
  );

  // ViewModels
  getIt.registerSingleton<MovieViewModel>(
    MovieViewModel(repository: getIt<MovieRepository>()),
  );

  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(repository: getIt<MovieRepository>()),
  );

  getIt.registerLazySingleton<PaywallViewModel>(
    () => PaywallViewModel(repository: getIt<SubscriptionRepository>()),
  );

  // Router
  getIt.registerSingleton<AppRouter>(AppRouter());
}
