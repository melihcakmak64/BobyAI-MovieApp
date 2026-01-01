import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_task/core/constants/image_paths.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/theme/app_text_styles.dart';
import 'package:movie_app_task/core/widgets/custom_button.dart';
import 'package:movie_app_task/presentation/view/payment/widgets/pricing_card_widget.dart';
import 'package:movie_app_task/presentation/viewmodel/paywall_view_model.dart';
import 'package:movie_app_task/routes/app_router.dart';

class VariantB extends StatelessWidget {
  final PaywallViewModel viewModel = GetIt.I<PaywallViewModel>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bckground Image
        Positioned.fill(
          child: Image.asset(AImage.paywallImage, fit: BoxFit.cover),
        ),

        // Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.9),
                  Colors.black,
                ],
                stops: [0.0, 0.4, 0.7, 1.0],
              ),
            ),
          ),
        ),

        // Content
        SafeArea(
          minimum: EdgeInsets.only(bottom: 33.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: AppColors.white, size: 24.w),
                  onPressed: () {
                    context.router.pushAndPopUntil(
                      const HomeRoute(),
                      predicate: (_) => false,
                    );
                  },
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // App Name
                    Text("MovieAI", style: TextStyles.font32Bold),

                    29.verticalSpace,
                    Observer(
                      builder: (_) => Column(
                        spacing: 16.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: viewModel.allFeatures.map((feature) {
                          return _buildChecklist(
                            feature.name,
                            viewModel.isFeatureActive(feature.id),
                          );
                        }).toList(),
                      ),
                    ),

                    52.verticalSpace,

                    Observer(
                      builder: (_) => Column(
                        spacing: 24.h,
                        children: viewModel.plans.map((plan) {
                          return PricingCard(
                            title: plan.title,
                            subtitle: plan.subtitle,
                            price: plan.price,
                            badge: plan.badge,
                            isSelected: viewModel.selectedPlan.id == plan.id,
                            onTap: () => viewModel.selectPlan(plan),
                          );
                        }).toList(),
                      ),
                    ),
                    20.verticalSpace,

                    // Auto Renewable Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageHelper.asset(
                          AImage.protectIcon,
                          fit: BoxFit.contain,
                          width: 16.w,
                          height: 16.w,
                        ),
                        6.horizontalSpace,
                        Text(
                          "Auto Renewable, Cancel Anytime",
                          style: TextStyles.font10Regular,
                        ),
                      ],
                    ),

                    12.verticalSpace,
                    CustomButton(
                      isActive: false,
                      text: "Continue",
                      onPressed: () {
                        viewModel.purchaseSubscription();
                        context.router.pushAndPopUntil(
                          const HomeRoute(),
                          predicate: (_) => false,
                        );
                      },
                    ),

                    20.verticalSpace,

                    // Footer Links
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildFooterLink("Terms of Use"),
                        _buildFooterLink("Restore Purchase"),
                        _buildFooterLink("Privacy Policy"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChecklist(String title, bool isActive) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isActive ? Icons.check : Icons.close,
          color: Colors.white,
          size: 14.w,
        ),
        12.horizontalSpace,
        Text(title, style: TextStyles.font14SemiBold),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(text, style: TextStyles.font8Regular),
    );
  }
}
