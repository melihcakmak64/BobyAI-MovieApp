import 'package:mobx/mobx.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';
import 'package:movie_app_task/data/repository/movie_repository.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final MovieRepository repository;
  _HomeViewModelBase({required this.repository});

  @observable
  bool isLoading = false;

  @observable
  List<MovieModel> movies = [];

  @observable
  List<MovieModel> recommendedMovies = [];

  @observable
  String? errorMessage;

  @action
  Future<void> fetchMoviesForSelectedGenres(
    List<GenreModel> selectedGenres,
  ) async {
    if (selectedGenres.isEmpty) return;

    isLoading = true;
    errorMessage = null;

    try {
      final genreIds = selectedGenres.map((g) => g.id).toList();
      recommendedMovies = await repository.getMoviesByGenres(genreIds);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
