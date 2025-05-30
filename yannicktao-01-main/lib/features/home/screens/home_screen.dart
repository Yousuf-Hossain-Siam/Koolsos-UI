import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/core/utils/constants/icon_path.dart';
import 'package:yannicktao/features/home/controller/home_screen_controller.dart';
import 'package:yannicktao/features/home/widget/order_status_card.dart';

import '../widget/custom_line_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // title and dropdown
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppText.homeScreenTitle,
                    style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary
                    ),
                  ),
                ),

                Obx(
                      () => DropdownButton<String>(
                    value:
                    Get.find<HomeScreenController>()
                        .orderDurationController
                        .value,
                    style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary
                    ),
                    underline: SizedBox(),
                    dropdownColor: Colors.white,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.secondary,
                      size: 35,
                    ),
                    items:
                    Get.find<HomeScreenController>().orderDurationDropdownList
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                        .toList(),
                    onChanged:
                        (String? newValue) => Get.find<HomeScreenController>()
                        .changeOrderDuration(newValue!),
                  ),
                ),
              ],
            ).marginOnly(top: 10),

            // order details
            SizedBox(
              child: Column(
                children: [
                  // 1st row
                  Row(
                    children: [
                      Expanded(
                        child: OrderStatusCard(
                          cardColor: Color(0xFFA100FF),
                          itemNumber: 12,
                          imagePath: IconPath.newOrder,
                          cardTitle: 'New Order',
                        ),
                      ),

                      SizedBox(width: 16,),
                      Expanded(
                        child: OrderStatusCard(
                          cardColor: Color(0xFF0059FF),
                          itemNumber: 12,
                          imagePath: IconPath.processingOrder,
                          cardTitle: 'Processing Order',
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: 16),

                  // 2nd row
                  Row(
                    children: [
                      Expanded(
                        child: OrderStatusCard(
                          cardColor: Color(0xFF00C241),
                          itemNumber: 12,
                          imagePath: IconPath.completeOrder,
                          cardTitle: 'New Order',
                        ),
                      ),

                      SizedBox(width: 16,),
                      Expanded(
                        child: OrderStatusCard(
                          cardColor: Color(0xFFFF0000),
                          itemNumber: 12,
                          imagePath: IconPath.cancelOrder,
                          cardTitle: 'Processing Order',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ).marginOnly(top: 20),

            // earning graph
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // earning and dropdown
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppText.homeScreenEarningTitle,
                          style: getTextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary
                          ),
                        ),
                      ),

                      Obx(
                            () => DropdownButton<String>(
                          value:
                          Get.find<HomeScreenController>()
                              .earningDurationController
                              .value,
                          style: getTextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondary
                          ),
                          underline: SizedBox(),
                          dropdownColor: Colors.white,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.secondary,
                            size: 35,
                          ),
                          items:
                          Get.find<HomeScreenController>().earningDurationDropdownList
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                              .toList(),
                          onChanged:
                              (String? newValue) => Get.find<HomeScreenController>()
                              .changeEarningDuration(newValue!),
                        ),
                      ),
                    ],
                  ).marginOnly(top: 10, bottom: 16),


                  CustomLineChart()
                ],
              ),
            ).marginOnly(top: 30, bottom: 16)
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
