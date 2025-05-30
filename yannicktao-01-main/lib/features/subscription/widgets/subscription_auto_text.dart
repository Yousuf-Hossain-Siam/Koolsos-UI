import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/subscription/controller/subscription_screen_controller.dart';

class SubscriptionAutoText extends StatelessWidget {
  const SubscriptionAutoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Obx(() {
                return GestureDetector(
                  onTap:
                      () => Get.find<SubscriptionController>()
                          .subscriptionAutoRenew(
                            !Get.find<SubscriptionController>()
                                .subscriptionAutoRenew
                                .value,
                          ),
                  child: Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Get.find<SubscriptionController>()
                                    .subscriptionAutoRenew
                                    .value
                                ? AppColors.success
                                : Colors.black,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),

                    child:
                        Get.find<SubscriptionController>()
                                .subscriptionAutoRenew
                                .value
                            ? Icon(
                              Icons.check,
                              size: 13,
                              color:
                                  Get.find<SubscriptionController>()
                                          .subscriptionAutoRenew
                                          .value
                                      ? AppColors.success
                                      : Colors.black,
                            )
                            : SizedBox(),
                  ),
                ).marginOnly(left: 15);
              }),
              Text(
                AppText.subscriptionScreenCheckBox,
                style: getTextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 4.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ).marginOnly(left: 10),
            ],
          ),
        ),
        Text(
          AppText.subscriptionScreenCheckBoxDetails,
          textAlign: TextAlign.start,
          style: getTextStyle(
            fontFamily: 'montserrat',
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
            shadows: [
              Shadow(
                offset: Offset(0, 1),
                blurRadius: 4.0,
                color: Colors.black26,
              ),
            ],
          ),
        ).marginOnly(bottom: 16, left: 68, right: 16),
      ],
    );
  }
}
