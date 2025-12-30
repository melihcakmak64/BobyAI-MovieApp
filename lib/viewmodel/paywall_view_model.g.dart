// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paywall_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaywallViewModel on _PaywallViewModelBase, Store {
  late final _$activeVariantAtom = Atom(
    name: '_PaywallViewModelBase.activeVariant',
    context: context,
  );

  @override
  PaywallVariant get activeVariant {
    _$activeVariantAtom.reportRead();
    return super.activeVariant;
  }

  @override
  set activeVariant(PaywallVariant value) {
    _$activeVariantAtom.reportWrite(value, super.activeVariant, () {
      super.activeVariant = value;
    });
  }

  late final _$isFreeTrialEnabledAtom = Atom(
    name: '_PaywallViewModelBase.isFreeTrialEnabled',
    context: context,
  );

  @override
  bool get isFreeTrialEnabled {
    _$isFreeTrialEnabledAtom.reportRead();
    return super.isFreeTrialEnabled;
  }

  @override
  set isFreeTrialEnabled(bool value) {
    _$isFreeTrialEnabledAtom.reportWrite(value, super.isFreeTrialEnabled, () {
      super.isFreeTrialEnabled = value;
    });
  }

  late final _$selectedPlanAtom = Atom(
    name: '_PaywallViewModelBase.selectedPlan',
    context: context,
  );

  @override
  SubscriptionPlan? get selectedPlan {
    _$selectedPlanAtom.reportRead();
    return super.selectedPlan;
  }

  @override
  set selectedPlan(SubscriptionPlan? value) {
    _$selectedPlanAtom.reportWrite(value, super.selectedPlan, () {
      super.selectedPlan = value;
    });
  }

  late final _$plansAtom = Atom(
    name: '_PaywallViewModelBase.plans',
    context: context,
  );

  @override
  ObservableList<SubscriptionPlan> get plans {
    _$plansAtom.reportRead();
    return super.plans;
  }

  @override
  set plans(ObservableList<SubscriptionPlan> value) {
    _$plansAtom.reportWrite(value, super.plans, () {
      super.plans = value;
    });
  }

  late final _$_PaywallViewModelBaseActionController = ActionController(
    name: '_PaywallViewModelBase',
    context: context,
  );

  @override
  void _determineVariant() {
    final _$actionInfo = _$_PaywallViewModelBaseActionController.startAction(
      name: '_PaywallViewModelBase._determineVariant',
    );
    try {
      return super._determineVariant();
    } finally {
      _$_PaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _initPlans() {
    final _$actionInfo = _$_PaywallViewModelBaseActionController.startAction(
      name: '_PaywallViewModelBase._initPlans',
    );
    try {
      return super._initPlans();
    } finally {
      _$_PaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFreeTrial(bool value) {
    final _$actionInfo = _$_PaywallViewModelBaseActionController.startAction(
      name: '_PaywallViewModelBase.toggleFreeTrial',
    );
    try {
      return super.toggleFreeTrial(value);
    } finally {
      _$_PaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPlan(SubscriptionPlan plan) {
    final _$actionInfo = _$_PaywallViewModelBaseActionController.startAction(
      name: '_PaywallViewModelBase.selectPlan',
    );
    try {
      return super.selectPlan(plan);
    } finally {
      _$_PaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void purchaseSubscription() {
    final _$actionInfo = _$_PaywallViewModelBaseActionController.startAction(
      name: '_PaywallViewModelBase.purchaseSubscription',
    );
    try {
      return super.purchaseSubscription();
    } finally {
      _$_PaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeVariant: ${activeVariant},
isFreeTrialEnabled: ${isFreeTrialEnabled},
selectedPlan: ${selectedPlan},
plans: ${plans}
    ''';
  }
}
