import 'package:mobx/mobx.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';
import 'package:movie_app_task/data/repository/movie_repository.dart';

part 'movie_view_model.g.dart';

class MovieViewModel = _MovieViewModelBase with _$MovieViewModel;

abstract class _MovieViewModelBase with Store {
  final MovieRepository repository = MovieRepository();

  @observable
  bool isLoading = false;

  @observable
  bool isFetchingMore = false;

  @observable
  int currentPage = 1;

  @observable
  List<MovieModel> movies = [];

  @observable
  List<MovieModel> recommendedMovies = [];

  @observable
  ObservableList<GenreModel> genres = ObservableList();

  @observable
  ObservableList<MovieModel> selectedMovies = ObservableList();

  @observable
  ObservableList<GenreModel> selectedGenres = ObservableList();

  @observable
  String? errorMessage;

  @action
  Future<void> fetchMovies() async {
    isLoading = true;
    errorMessage = null;
    try {
      currentPage = 1;
      movies = await repository.getPopularMovies(page: currentPage);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchGenres() async {
    isLoading = true;
    errorMessage = null;
    try {
      final fetchedGenres = await repository.getGenres();
      genres = ObservableList.of(fetchedGenres);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchMoreMovies() async {
    if (isFetchingMore) return;

    isFetchingMore = true;
    try {
      final newMovies = await repository.getPopularMovies(
        page: currentPage + 1,
      );
      currentPage++;
      movies = [...movies, ...newMovies];
    } finally {
      isFetchingMore = false;
    }
  }

  @action
  Future<void> fetchMoviesForSelectedGenres() async {
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

  @action
  void toggleMovie(MovieModel movie) {
    if (selectedMovies.contains(movie)) {
      selectedMovies.remove(movie);
    } else {
      if (selectedMovies.length < 3) {
        selectedMovies.add(movie);
      }
    }
  }

  @action
  void toggleGenre(GenreModel genre) {
    if (selectedGenres.contains(genre)) {
      selectedGenres.remove(genre);
    } else {
      if (selectedGenres.length < 2) {
        selectedGenres.add(genre);
      }
    }
  }
}
