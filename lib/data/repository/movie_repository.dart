import 'package:movie_app_task/core/constants/api_constants.dart';
import 'package:movie_app_task/core/network/dio_client.dart';
import 'package:movie_app_task/data/dtos/movie_dto.dart';
import 'package:movie_app_task/domain/mapper/movie_mapper.dart';
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
}
