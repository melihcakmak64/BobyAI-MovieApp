import 'dart:async';
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
  String? searchQuery;

  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  List<MovieModel> movies = [];

  @observable
  List<MovieModel> recommendedMovies = [];

  @observable
  List<MovieModel> searchResults = [];

  @observable
  String? errorMessage;

  Timer? _debounceTimer;

  @action
  void setSearchQuery(String? query) {
    searchQuery = query;
    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(milliseconds: 500), () {
      _handleSearch(query);
    });
  }

  @action
  Future<void> _handleSearch(String? query) async {
    if (query == null || query.isEmpty) {
      searchResults = [];
      isSearching = false;
      return;
    }

    isSearching = true;

    try {
      searchResults = await repository.searchMovies(query);
    } catch (e) {
      searchResults = [];
      errorMessage = e.toString();
    } finally {
      isSearching = false;
    }
  }

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

  @action
  void resetSearch() {
    searchQuery = null;
    searchResults = [];
    _debounceTimer?.cancel();
  }
}
