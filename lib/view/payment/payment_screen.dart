import 'package:flutter/material.dart';
import 'package:movie_app_task/view/payment/variant_a_screen.dart';
import 'package:movie_app_task/view/payment/variant_b_screen.dart';
import 'package:movie_app_task/viewmodel/paywall_view_model.dart';

class PaywallScreen extends StatefulWidget {
  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  late final PaywallViewModel viewModel;
  @override
  void initState() {
    viewModel = PaywallViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (viewModel.activeVariant) {
        PaywallVariant.variantA => VariantA(viewModel: viewModel),
        PaywallVariant.variantB => VariantB(viewModel: viewModel),
      },
    );
  }
}
