import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:movie_app_task/data/repository/subscription_repository.dart';
import 'package:movie_app_task/domain/model/subscription_model.dart';
part 'paywall_view_model.g.dart';

enum PaywallVariant { variantA, variantB }

class PaywallViewModel = _PaywallViewModelBase with _$PaywallViewModel;

abstract class _PaywallViewModelBase with Store {
  final SubscriptionRepository repository;

  @observable
  late PaywallVariant activeVariant;

  @observable
  bool isFreeTrialEnabled = false;

  @observable
  late SubscriptionPlan selectedPlan;

  @observable
  ObservableList<SubscriptionPlan> plans = ObservableList();

  @observable
  ObservableList<AppFeature> allFeatures = ObservableList();

  _PaywallViewModelBase({required this.repository}) {
    activeVariant = _determineVariant();
    _initData();
  }

  @action
  void _initData() {
    allFeatures.addAll(repository.getAllFeatures());
    plans.addAll(repository.getSubscriptionPlans());
    selectedPlan = plans.firstWhere(
      (e) => e.id == 1,
      orElse: () => plans.first,
    );
  }

  @action
  PaywallVariant _determineVariant() {
    return PaywallVariant.values[Random().nextInt(
      PaywallVariant.values.length,
    )];
  }

  @action
  void toggleFreeTrial(bool value) => isFreeTrialEnabled = value;

  @action
  void selectPlan(SubscriptionPlan plan) {
    selectedPlan = plan;
  }

  @computed
  Set<int> get activeFeatureIds {
    if (isFreeTrialEnabled) {
      return allFeatures.map((e) => e.id).toSet();
    }
    return selectedPlan.featureIds.toSet();
  }

  @action
  void purchaseSubscription() {}
}
