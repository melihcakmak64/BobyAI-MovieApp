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
 /*   final response = await _dioClient.dio.get(
      ApiConstants.popularMovies(page: page),
    );*/

    const mockApiV2Response = {
  "results": [
    {
      "movie_id": 1242898,
      "movie_title": "Predator: Badlands",
      "movie_description":
          "Cast out from his clan, a young Predator finds an unlikely ally in a damaged android and embarks on a treacherous journey in search of the ultimate adversary.",
      "poster_url": "/ef2QSeBkrYhAdfsWGXmp0lvH0T1.jpg",
      "rating_score": 7.323,
      "released_at": "2025-11-05",
      "genres": [28, 878, 12],
      "popularity_score": 116.9332,
      "adult": false,
      "video": false
    },
    {
      "movie_id": 1419406,
      "movie_title": "The Shadow's Edge",
      "movie_description":
          "Macau Police brings the tracking expert police officer out of retirement to help catch a dangerous group of professional thieves.",
      "poster_url": "/e0RU6KpdnrqFxDKlI3NOqN8nHL6.jpg",
      "rating_score": 6.7,
      "released_at": "2025-08-16",
      "genres": [28, 80, 53],
      "popularity_score": 116.4061,
      "adult": false,
      "video": false
    }
  ]
};


    return (mockApiV2Response['results'] as List)
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
