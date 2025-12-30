import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app_task/view/payment/variant_a_screen.dart';
import 'package:movie_app_task/view/payment/variant_b_screen.dart';
import 'package:movie_app_task/viewmodel/paywall_view_model.dart';

class PaywallScreen extends StatelessWidget {
  final PaywallViewModel viewModel = PaywallViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (viewModel.activeVariant) {
            case PaywallVariant.variantA:
              return VariantA(viewModel: viewModel);
            case PaywallVariant.variantB:
              return VariantB(viewModel: viewModel);
          }
        },
      ),
    );
  }
}
