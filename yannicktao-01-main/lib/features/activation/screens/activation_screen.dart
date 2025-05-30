import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/common/widgets/custom_submit_button.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/subscription/screens/subscription_plan_screen.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/common/widgets/custom_back_button.dart';
import '../../../core/utils/constants/app_texts.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  AppText.activationScreenTitle,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ).marginOnly(top: 24, bottom: 16),
              ),

              // CustomBackButton(),
            ],
          ),

          // subtitle
          Expanded(
            child: Text(
              AppText.activationScreenSubTitle,
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontFamily: 'montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.success,
              ),
            ).marginOnly(top: 16),
          ),

          Column(
            children: [
              Text(
                AppText.subscriptionScreenInitialTitle,
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontFamily: 'bricolage',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.accent,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ).marginOnly(bottom: 16),

              InkWell(
                onTap:
                    () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SubscriptionPlan()),
                ),
                child: CustomSubmitButton(
                  hintText: 'Renew',
                  innerShadow: true,
                  color: AppColors.accent,
                ).marginOnly(bottom: 40),
              ),
            ],
          ),
        ],
      ).marginSymmetric(horizontal: 16),
    );
  }
}
