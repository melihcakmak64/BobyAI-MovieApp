import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/constants/image_paths.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/core/widgets/custom_button.dart';
import 'package:movie_app_task/view/payment/widgets/pricing_card_widget.dart';
import 'package:movie_app_task/viewmodel/paywall_view_model.dart';

class VariantA extends StatelessWidget {
  final PaywallViewModel viewModel;
  const VariantA({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            // Header
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            Column(
              children: [
                Text(
                  "AppName",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 30.h),

                // Table Container
                Column(
                  spacing: 16.h,
                  children: [
                    Row(
                      children: [
                        Expanded(flex: 3, child: SizedBox()),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              "FREE",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              "PRO",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    _buildFeatureRow("Daily Movie Suggestions", true, true),
                    _buildFeatureRow("AI-Powered Movie Insights", false, true),
                    _buildFeatureRow("Personalized Watchlists", false, true),
                    _buildFeatureRow("Ad-Free Experience", false, true),
                  ],
                ),

                SizedBox(height: 24.h),

                // Free Trial Toggle
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.redLight),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enable Free Trial",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Observer(
                        builder: (_) => SizedBox(
                          height: 31.h,
                          width: 51.w,
                          child: Switch(
                            value: viewModel.isFreeTrialEnabled,
                            onChanged: (val) => viewModel.toggleFreeTrial(val),
                            activeThumbColor: AppColors.redLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 37.h),

                Observer(
                  builder: (_) => Column(
                    spacing: 20.h,
                    children: viewModel.plans.map((plan) {
                      return PricingCard(
                        title: plan.title,
                        subtitle: plan.subtitle,
                        price: plan.price,
                        badge: plan.badge,
                        isSelected: viewModel.selectedPlan?.id == plan.id,
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
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                CustomButton(
                  text: "No Payment Now",
                  onPressed: () => viewModel.purchaseSubscription(),
                ),
                SizedBox(height: 16.h),

                // Footer Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFooterLink("Terms of Use"),
                    _buildFooterLink("Restore Purchase"),
                    _buildFooterLink("Privacy Policy"),
                  ],
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String title, bool isFree, bool isPro) {
    return Row(
      children: [
        // Feature Name
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // FREE Column
        Expanded(
          flex: 1,
          child: Center(
            child: Icon(
              isFree ? Icons.check_circle : Icons.cancel,
              color: isFree ? Colors.green : Colors.grey[700],
              size: 24.w,
            ),
          ),
        ),
        // PRO Column
        Expanded(
          flex: 1,
          child: Center(
            child: Icon(
              isPro ? Icons.check_circle : Icons.cancel,
              color: isPro ? Colors.green : Colors.grey[700],
              size: 24.w,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          color: Colors.white70,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
