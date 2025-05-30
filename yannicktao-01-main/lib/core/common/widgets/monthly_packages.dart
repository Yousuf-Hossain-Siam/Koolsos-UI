import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/subscription/controller/subscription_screen_controller.dart';
import 'package:yannicktao/features/subscription/widgets/package_card.dart';

class MonthlyPackage extends StatelessWidget {
  const MonthlyPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => Get.find<SubscriptionController>().changeSubscriptionPlanDuration(12, 96),
          child: PackageCard(
            activeBoxColor: AppColors.activeBox1Color,
            inactiveBoxColor: AppColors.inactiveBox1Color,
            packageDuration: 12,
          ),
        ),
        GestureDetector(
          onTap: () => Get.find<SubscriptionController>().changeSubscriptionPlanDuration(6, 48),
          child: PackageCard(
            activeBoxColor: AppColors.activeBox2Color,
            inactiveBoxColor: AppColors.inactiveBox2Color,
            packageDuration: 6,
          ),
        ),
        GestureDetector(
          onTap: () => Get.find<SubscriptionController>().changeSubscriptionPlanDuration(1, 24),
          child: PackageCard(
            activeBoxColor: AppColors.activeBox3Color,
            inactiveBoxColor: AppColors.inactiveBox3Color,
            packageDuration: 1,
          ),
        ),
      ],
    );
  }
}
