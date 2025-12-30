import 'package:movie_app_task/data/dtos/genre_dto.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';

extension GenreDtoMapper on GenreDto {
  GenreModel toDomain() {
    return GenreModel(id: id, name: name);
  }
}
