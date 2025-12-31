import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/view/payment/variant_a_screen.dart';
import 'package:movie_app_task/view/payment/variant_b_screen.dart';
import 'package:movie_app_task/viewmodel/paywall_view_model.dart';

class PaywallScreen extends StatelessWidget {
  final PaywallViewModel viewModel = GetIt.I<PaywallViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (viewModel.activeVariant) {
        PaywallVariant.variantA => VariantA(),
        PaywallVariant.variantB => VariantB(),
      },
    );
  }
}
