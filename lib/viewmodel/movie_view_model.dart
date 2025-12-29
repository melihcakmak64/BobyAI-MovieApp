import 'package:mobx/mobx.dart';
import 'package:movie_app_task/data/model/movie_model.dart';
import 'package:movie_app_task/data/repository/movie_repository.dart';

part 'movie_view_model.g.dart';

class MovieViewModel = _MovieViewModelBase with _$MovieViewModel;

abstract class _MovieViewModelBase with Store {
  final MovieRepository repository = MovieRepository();

  @observable
  bool isLoading = false;

  @observable
  List<MovieModel> movies = [];

  @observable
  String? errorMessage;

  @action
  Future<void> fetchMovies() async {
    isLoading = true;
    errorMessage = null;

    try {
      movies = await repository.getPopularMovies();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
