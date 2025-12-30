import 'package:movie_app_task/core/constants/api_constants.dart';
import 'package:movie_app_task/core/network/dio_client.dart';
import 'package:movie_app_task/data/dtos/genre_dto.dart';
import 'package:movie_app_task/data/dtos/movie_dto.dart';
import 'package:movie_app_task/domain/mapper/genre_mapper.dart';
import 'package:movie_app_task/domain/mapper/movie_mapper.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';

class MovieRepository {
  final DioClient _dioClient = DioClient();

  Future<List<MovieModel>> getPopularMovies({int page = 1}) async {
    final response = await _dioClient.dio.get(
      ApiConstants.popularMovies(page: page),
    );

    return (response.data['results'] as List)
        .map((e) => MovieDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<GenreModel>> getGenres() async {
    final response = await _dioClient.dio.get(ApiConstants.genres);
    return (response.data['genres'] as List)
        .map((e) => GenreDto.fromJson(e).toDomain())
        .toList();
  }

  Future<List<MovieModel>> getMoviesByGenres(List<int> genreIds) async {
    final genresParam = genreIds.join(',');

    final response = await _dioClient.dio.get(
      ApiConstants.discoverMovies,
      queryParameters: {'with_genres': genresParam},
    );

    final movies = (response.data['results'] as List)
        .map((e) => MovieDto.fromJson(e).toDomain())
        .toList();

    return movies.take(9).toList();
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await _dioClient.dio.get(
      ApiConstants.searchMovies,
      queryParameters: {'query': query},
    );

    return (response.data['results'] as List)
        .map((e) => MovieDto.fromJson(e).toDomain())
        .toList();
  }
}
