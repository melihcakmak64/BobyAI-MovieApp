import 'package:movie_app_task/core/constants/api_constants.dart';
import 'package:movie_app_task/core/network/dio_client.dart';
import 'package:movie_app_task/data/model/movie_model.dart';

class MovieRepository {
  final DioClient _dioClient = DioClient();

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _dioClient.dio.get(ApiConstants.getPopularMovies);

    return (response.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }
}
