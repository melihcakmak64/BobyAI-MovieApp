import 'package:movie_app_task/data/dtos/app_feature_dto.dart';
import 'package:movie_app_task/data/dtos/susbcription_plan_dto.dart';
import 'package:movie_app_task/domain/mapper/app_feature_mapper.dart';
import 'package:movie_app_task/domain/mapper/subcription_plan_mapper.dart';
import 'package:movie_app_task/domain/model/subscription_model.dart';

class SubscriptionRepository {
  final List<Map<String, dynamic>> _featuresJson = [
    {"id": 1, "name": "Daily Movie Suggestions", "isAvailableInFree": true},
    {"id": 2, "name": "AI-Powered Movie Insights", "isAvailableInFree": false},
    {"id": 3, "name": "Personalized Watchlists", "isAvailableInFree": false},
    {"id": 4, "name": "Ad-Free Experience", "isAvailableInFree": false},
  ];

  final List<Map<String, dynamic>> _plansJson = [
    {
      "id": 0,
      "title": "Weekly",
      "subtitle": "\$4.99 / per week",
      "price": "\$4.99 / week",
      "featureIds": [1, 2],
    },
    {
      "id": 1,
      "title": "Monthly",
      "subtitle": "\$11.99 / month",
      "price": "\$2.99 / week",
      "featureIds": [1, 2, 3],
    },
    {
      "id": 2,
      "title": "Yearly",
      "subtitle": "\$49.99 / year",
      "price": "\$0.96 / week",
      "badge": "Best Value",
      "featureIds": [1, 2, 3, 4],
    },
  ];

  List<AppFeature> getAllFeatures() {
    return _featuresJson
        .map((json) => AppFeatureDto.fromJson(json).toDomain())
        .toList();
  }

  List<SubscriptionPlan> getSubscriptionPlans() {
    return _plansJson
        .map((json) => SubscriptionPlanDto.fromJson(json).toDomain())
        .toList();
  }
}
