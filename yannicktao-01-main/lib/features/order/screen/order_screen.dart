import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/features/order/controller/order_screen_controller.dart';
import 'package:yannicktao/features/order/widget/order_tile_widget.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/colors.dart';
import '../../home/controller/home_screen_controller.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title and dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  AppText.orderScreenTitle,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ).marginOnly(top: 24, bottom: 16),
              ),

              Obx(
                    () => DropdownButton<String>(
                  value:
                  Get.find<OrderScreenController>()
                      .orderDurationController
                      .value,
                  style: getTextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
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
          ),


          // order list
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: 10,
              itemBuilder:
                  (context, index) => OrderTileWidget(
                color:
                AppColors.orderTileColors[index %
                    AppColors.orderTileColors.length],
                serialNumber: '004',
                orderNumber: '#HF0004',
                orderName: 'Refregeration Serviceing',
                clientName: 'John Mitchell',
                phoneNumber: '+888 8888 8888',
                location: '1 World Trade Center, New York, NY 10007',
                majorTextColor:
                AppColors.orderTextColors[index %
                    AppColors.orderTextColors.length],
                orderStatus: 'New',
              ).marginOnly(bottom: index == 10-1 ? 16 : 0),
            ),
          )
        ],
      ).marginSymmetric(horizontal: 16),
    );
  }
}
