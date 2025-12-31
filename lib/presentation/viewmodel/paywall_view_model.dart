import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:movie_app_task/domain/model/subscription_model.dart';
part 'paywall_view_model.g.dart';

enum PaywallVariant { variantA, variantB }

class PaywallViewModel = _PaywallViewModelBase with _$PaywallViewModel;

abstract class _PaywallViewModelBase with Store {
  late final PaywallVariant activeVariant;

  @observable
  bool isFreeTrialEnabled = false;

  @observable
  SubscriptionPlan? selectedPlan;
  @observable
  ObservableList<SubscriptionPlan> plans = ObservableList();

  _PaywallViewModelBase() {
    activeVariant = _determineVariant();
    _initPlans();
  }

  @action
  PaywallVariant _determineVariant() {
    final random = Random();
    return PaywallVariant.values[random.nextInt(PaywallVariant.values.length)];
  }

  @action
  void _initPlans() {
    plans.addAll([
      SubscriptionPlan(
        id: 0,
        title: 'Weekly',
        subtitle: '\$4.99 / per week',
        price: '\$4.99 / week',
      ),
      SubscriptionPlan(
        id: 1,
        title: 'Monthly',
        subtitle: '\$11.99 / month',
        price: '\$2.99 / week',
      ),
      SubscriptionPlan(
        id: 2,
        title: 'Yearly',
        subtitle: '\$49.99 / year',
        price: '\$0.96 / week',
        badge: 'Best Value',
      ),
    ]);

    selectedPlan = plans.firstWhere((e) => e.id == 1);
  }

  @action
  void toggleFreeTrial(bool value) => isFreeTrialEnabled = value;

  @action
  void selectPlan(SubscriptionPlan plan) {
    selectedPlan = plan;
  }

  @action
  void purchaseSubscription() {}
}
