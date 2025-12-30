import 'package:movie_app_task/core/constants/api_constants.dart';
import 'package:movie_app_task/data/dtos/movie_dto.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';

extension MovieDtoMapper on MovieDto {
  MovieModel toDomain() {
    return MovieModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: "${ApiConstants.imageBaseUrl}$posterPath",
      rating: rating,
    );
  }
}
