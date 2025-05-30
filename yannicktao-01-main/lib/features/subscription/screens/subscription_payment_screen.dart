import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/common/widgets/custom_submit_button.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/core/utils/constants/icon_path.dart';


import '../../stripe/stripe_controller.dart';

class SubscriptionPaymentScreen extends StatelessWidget {
  const SubscriptionPaymentScreen({super.key, required this.totalAmount});

  final int totalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Row(
          //   children: [
          //     Expanded(
          //       child: SizedBox(),
          //     ),
          //     CustomBackButton().marginOnly(right: 16)
          //   ],
          // ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.subscriptionScreenTotalAmount,
                  style: getTextStyle(
                    fontFamily: "bricolage",
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textCyan,
                  ),
                ),

                Stack(
                  children: [
                    // total amount
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        totalAmount.toString(),
                        style: getTextStyle(
                          fontFamily: "bricolage",
                          fontSize: 86,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              offset: Offset(2, 2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // dolor icon
                    Align(alignment: Alignment.center,child: Image.asset(IconPath.dollar, scale: 17)).marginOnly(right: 170, top: 30),


                  ],
                ),
              ],
            ),
          ),

          // submit button
          GestureDetector(
            onTap: () => Get.find<StripeController>().makePayment(context),
            child: CustomSubmitButton(
              hintText: 'Pay Now',
              color: AppColors.accent,
              innerShadow: true,
            ).paddingSymmetric(horizontal: 16, vertical: 16),
          ),
        ],
      ),
    );
  }
}
