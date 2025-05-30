import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/subscription/controller/subscription_screen_controller.dart';

import '../../../core/common/styles/global_text_style.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.activeBoxColor,
    required this.inactiveBoxColor,
    required this.packageDuration,
  });

  final Color activeBoxColor;
  final Color inactiveBoxColor;
  final int packageDuration;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final _pacakgeDuration = Get.find<SubscriptionController>().subscriptionPlanDuration.value;
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // discount section
            InnerShadow(
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  offset: Offset(2, 0),
                  blurRadius: 8,
                ),
              ],
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: 130,
                  maxHeight: 130
                ),
                decoration: BoxDecoration(
                  color: packageDuration == _pacakgeDuration? activeBoxColor: inactiveBoxColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: activeBoxColor, width: 2),
                ),

                // plan details section
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // package duration
                    Text(
                      packageDuration.toString(),
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 34, // Slightly smaller for better fit
                        fontWeight: FontWeight.bold,
                        color: packageDuration == _pacakgeDuration ? Colors.white : activeBoxColor,
                      ),
                    ),

                    // months
                    Text(
                      AppText.subscriptionScreenMonth,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 12, // Slightly smaller for better fit
                        fontWeight: FontWeight.w500,
                        color: packageDuration == _pacakgeDuration? Colors.white: AppColors.secondary,
                      ),
                    ),

                    // duration
                    Text(
                      '\$ 6.0/mt',
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 12, // Slightly smaller for better fit
                        fontWeight: FontWeight.w500,
                        color: packageDuration == _pacakgeDuration? Colors.white:  AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -15,
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    offset: Offset(2, 0),
                    blurRadius: 8,
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: packageDuration == _pacakgeDuration? inactiveBoxColor: activeBoxColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: activeBoxColor, width: 2),
                  ),
                  child: Text(
                    'Save 20%',
                    style: getTextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 10, // Adjusted for better fit
                      fontWeight: FontWeight.bold,
                      color: packageDuration == _pacakgeDuration?  AppColors.secondary: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
