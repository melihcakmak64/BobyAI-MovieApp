import 'package:movie_app_task/data/dtos/susbcription_plan_dto.dart';
import 'package:movie_app_task/domain/model/subscription_model.dart';

extension SubscriptionPlanDtoMapper on SubscriptionPlanDto {
  SubscriptionPlan toDomain() {
    return SubscriptionPlan(
      id: id,
      title: title,
      subtitle: subtitle,
      price: price,
      badge: badge,
      featureIds: featureIds, 
    );
  }
}