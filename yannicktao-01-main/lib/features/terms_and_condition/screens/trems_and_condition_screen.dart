import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/common/widgets/custom_back_button.dart';
import '../../../core/utils/constants/app_texts.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key, this.isPrivacyPolicy = false});

  final bool? isPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  isPrivacyPolicy! ? AppText.privacyPolicyTitle : AppText.termsAndConditionTitle,
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

          // last update
          RichText(
            text: TextSpan(
              style: getTextStyle(
                fontFamily: 'montserrat',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
              children: [
                TextSpan(
                  text: AppText.termsAndConditionLastUpdateTitle,
                  style: getTextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),

                TextSpan(text: isPrivacyPolicy! ? AppText.privacyPolicyLastUpdateDate :  AppText.termsAndConditionLastUpdateDate),
              ],
            ),
          ),

          // terms and condition
          Text(
            isPrivacyPolicy! ? AppText.privacyPolicy : AppText.termsAndCondition,
            style: getTextStyle(
              fontFamily: 'montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ).marginAll(16),
        ],
      ).marginSymmetric(horizontal: 16),
    );
  }
}
