// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieViewModel on _MovieViewModelBase, Store {
  late final _$isLoadingAtom = Atom(
    name: '_MovieViewModelBase.isLoading',
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

  late final _$isFetchingMoreAtom = Atom(
    name: '_MovieViewModelBase.isFetchingMore',
    context: context,
  );

  @override
  bool get isFetchingMore {
    _$isFetchingMoreAtom.reportRead();
    return super.isFetchingMore;
  }

  @override
  set isFetchingMore(bool value) {
    _$isFetchingMoreAtom.reportWrite(value, super.isFetchingMore, () {
      super.isFetchingMore = value;
    });
  }

  late final _$currentPageAtom = Atom(
    name: '_MovieViewModelBase.currentPage',
    context: context,
  );

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$moviesAtom = Atom(
    name: '_MovieViewModelBase.movies',
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
    name: '_MovieViewModelBase.recommendedMovies',
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

  late final _$genresAtom = Atom(
    name: '_MovieViewModelBase.genres',
    context: context,
  );

  @override
  ObservableList<GenreModel> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(ObservableList<GenreModel> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  late final _$selectedMoviesAtom = Atom(
    name: '_MovieViewModelBase.selectedMovies',
    context: context,
  );

  @override
  ObservableList<MovieModel> get selectedMovies {
    _$selectedMoviesAtom.reportRead();
    return super.selectedMovies;
  }

  @override
  set selectedMovies(ObservableList<MovieModel> value) {
    _$selectedMoviesAtom.reportWrite(value, super.selectedMovies, () {
      super.selectedMovies = value;
    });
  }

  late final _$selectedGenresAtom = Atom(
    name: '_MovieViewModelBase.selectedGenres',
    context: context,
  );

  @override
  ObservableList<GenreModel> get selectedGenres {
    _$selectedGenresAtom.reportRead();
    return super.selectedGenres;
  }

  @override
  set selectedGenres(ObservableList<GenreModel> value) {
    _$selectedGenresAtom.reportWrite(value, super.selectedGenres, () {
      super.selectedGenres = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_MovieViewModelBase.errorMessage',
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

  late final _$fetchMoviesAsyncAction = AsyncAction(
    '_MovieViewModelBase.fetchMovies',
    context: context,
  );

  @override
  Future<void> fetchMovies() {
    return _$fetchMoviesAsyncAction.run(() => super.fetchMovies());
  }

  late final _$fetchGenresAsyncAction = AsyncAction(
    '_MovieViewModelBase.fetchGenres',
    context: context,
  );

  @override
  Future<void> fetchGenres() {
    return _$fetchGenresAsyncAction.run(() => super.fetchGenres());
  }

  late final _$fetchMoreMoviesAsyncAction = AsyncAction(
    '_MovieViewModelBase.fetchMoreMovies',
    context: context,
  );

  @override
  Future<void> fetchMoreMovies() {
    return _$fetchMoreMoviesAsyncAction.run(() => super.fetchMoreMovies());
  }

  late final _$fetchMoviesForSelectedGenresAsyncAction = AsyncAction(
    '_MovieViewModelBase.fetchMoviesForSelectedGenres',
    context: context,
  );

  @override
  Future<void> fetchMoviesForSelectedGenres() {
    return _$fetchMoviesForSelectedGenresAsyncAction.run(
      () => super.fetchMoviesForSelectedGenres(),
    );
  }

  late final _$_MovieViewModelBaseActionController = ActionController(
    name: '_MovieViewModelBase',
    context: context,
  );

  @override
  void toggleMovie(MovieModel movie) {
    final _$actionInfo = _$_MovieViewModelBaseActionController.startAction(
      name: '_MovieViewModelBase.toggleMovie',
    );
    try {
      return super.toggleMovie(movie);
    } finally {
      _$_MovieViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleGenre(GenreModel genre) {
    final _$actionInfo = _$_MovieViewModelBaseActionController.startAction(
      name: '_MovieViewModelBase.toggleGenre',
    );
    try {
      return super.toggleGenre(genre);
    } finally {
      _$_MovieViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isFetchingMore: ${isFetchingMore},
currentPage: ${currentPage},
movies: ${movies},
recommendedMovies: ${recommendedMovies},
genres: ${genres},
selectedMovies: ${selectedMovies},
selectedGenres: ${selectedGenres},
errorMessage: ${errorMessage}
    ''';
  }
}
