import 'package:movie_app_task/data/dtos/app_feature_dto.dart';
import 'package:movie_app_task/domain/model/subscription_model.dart';

extension AppFeatureDtoMapper on AppFeatureDto {
  AppFeature toDomain() {
    return AppFeature(id: id, name: name, isAvailableInFree: isAvailableInFree);
  }
}
