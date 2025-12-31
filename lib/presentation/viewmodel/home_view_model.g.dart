// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$searchQueryAtom = Atom(
    name: '_HomeViewModelBase.searchQuery',
    context: context,
  );

  @override
  String? get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String? value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_HomeViewModelBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSearchingAtom = Atom(
    name: '_HomeViewModelBase.isSearching',
    context: context,
  );

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$moviesAtom = Atom(
    name: '_HomeViewModelBase.movies',
    context: context,
  );

  @override
  List<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$recommendedMoviesAtom = Atom(
    name: '_HomeViewModelBase.recommendedMovies',
    context: context,
  );

  @override
  List<MovieModel> get recommendedMovies {
    _$recommendedMoviesAtom.reportRead();
    return super.recommendedMovies;
  }

  @override
  set recommendedMovies(List<MovieModel> value) {
    _$recommendedMoviesAtom.reportWrite(value, super.recommendedMovies, () {
      super.recommendedMovies = value;
    });
  }

  late final _$searchResultsAtom = Atom(
    name: '_HomeViewModelBase.searchResults',
    context: context,
  );

  @override
  List<MovieModel> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(List<MovieModel> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_HomeViewModelBase.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_handleSearchAsyncAction = AsyncAction(
    '_HomeViewModelBase._handleSearch',
    context: context,
  );

  @override
  Future<void> _handleSearch(String? query) {
    return _$_handleSearchAsyncAction.run(() => super._handleSearch(query));
  }

  late final _$fetchMoviesForSelectedGenresAsyncAction = AsyncAction(
    '_HomeViewModelBase.fetchMoviesForSelectedGenres',
    context: context,
  );

  @override
  Future<void> fetchMoviesForSelectedGenres(List<GenreModel> selectedGenres) {
    return _$fetchMoviesForSelectedGenresAsyncAction.run(
      () => super.fetchMoviesForSelectedGenres(selectedGenres),
    );
  }

  late final _$_HomeViewModelBaseActionController = ActionController(
    name: '_HomeViewModelBase',
    context: context,
  );

  @override
  void setSearchQuery(String? query) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
      name: '_HomeViewModelBase.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSearch() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
      name: '_HomeViewModelBase.resetSearch',
    );
    try {
      return super.resetSearch();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
isLoading: ${isLoading},
isSearching: ${isSearching},
movies: ${movies},
recommendedMovies: ${recommendedMovies},
searchResults: ${searchResults},
errorMessage: ${errorMessage}
    ''';
  }
}
