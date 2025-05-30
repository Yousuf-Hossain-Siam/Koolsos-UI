import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/common/widgets/custom_back_button.dart';
import 'package:yannicktao/core/common/widgets/custom_submit_button.dart';
import 'package:yannicktao/core/common/widgets/monthly_packages.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/core/utils/constants/image_path.dart';
import 'package:yannicktao/features/subscription/controller/subscription_screen_controller.dart';
import 'package:yannicktao/features/subscription/screens/subscription_payment_screen.dart';
import 'package:yannicktao/features/subscription/widgets/subscription_auto_text.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: SizedBox(),
                  //     ),
                  //     CustomBackButton().marginOnly(right: 16)
                  //   ],
                  // ),

                  // background image
                  Image.asset(
                    ImagePath.subscription4,
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: MediaQuery.of(context).size.height * 0.36,
                    fit: BoxFit.contain,
                  ).marginOnly(bottom: 16),

                  // title
                  Text(
                    AppText.subscriptionPlanTitle,
                    style: getTextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textCyan,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 1),
                          blurRadius: 4.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ).marginOnly(bottom: 12),

                  Text(
                    AppText.subscriptionPlanSubTitle,
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 12,
                      color: AppColors.textPrimary,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 4.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),

                  MonthlyPackage().marginOnly(
                    left: 16,
                    right: 16,
                    top: 25,
                    bottom: 20,
                  ),

                  InkWell(
                    onTap:
                        () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: SubscriptionPaymentScreen(
                            totalAmount:
                                Get.find<SubscriptionController>()
                                    .subscriptionPlanAmount
                                    .value,
                          ),
                        ),
                    child: Obx(() {
                      final amount =
                          Get.find<SubscriptionController>()
                              .subscriptionPlanAmount
                              .value;
                      final months =
                          Get.find<SubscriptionController>()
                              .subscriptionPlanDuration
                              .value;
                      return CustomSubmitButton(
                        hintText: 'Get a $months months for \$$amount',
                        color: AppColors.accent,
                        innerShadow: true,
                      ).paddingSymmetric(horizontal: 16);
                    }),
                  ),
                  SizedBox(height: 10),
                  SubscriptionAutoText(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
