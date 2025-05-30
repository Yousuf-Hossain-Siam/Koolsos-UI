import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/common/widgets/custom_submit_button.dart';
import 'package:yannicktao/features/order/controller/order_screen_controller.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/common/widgets/custom_back_button.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/icon_path.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.serialNumber,
    required this.orderNumber,
    required this.orderName,
    required this.clientName,
    required this.phoneNumber,
    required this.location,
    required this.orderStatus,
    required this.majorTextColor,
  });

  final String serialNumber;
  final String orderNumber;
  final String orderName;
  final String clientName;
  final String phoneNumber;
  final String location;
  final String orderStatus;
  final Color majorTextColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
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
                    orderNumber,
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ).marginOnly(top: 24, bottom: 16),
                ),

              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // serial number
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                    children: <TextSpan>[
                      // serial number
                      TextSpan(text: 'Sl : '),
                      TextSpan(
                        text: serialNumber,
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: majorTextColor,
                        ),
                      ),
                    ],
                  ),
                ).marginOnly(bottom: 16),

                // order no
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                    children: <TextSpan>[
                      // serial number
                      TextSpan(text: 'Order No : '),
                      TextSpan(
                        text: orderNumber,
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: majorTextColor,
                        ),
                      ),
                    ],
                  ),
                ).marginOnly(bottom: 16),

                // order name
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                    children: <TextSpan>[
                      // serial number
                      TextSpan(text: 'Order : '),
                      TextSpan(
                        text: orderName,
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: majorTextColor,
                        ),
                      ),
                    ],
                  ),
                ).marginOnly(bottom: 16),

                // note
                Text(
                  'Note: I would like to schedule a '
                      'refrigeration servicing for my unit '
                      'at your earliest convenience.',

                  overflow: TextOverflow.visible,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accent,
                  ),
                ).marginOnly(bottom: 16),

                // client name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // user icon
                    Image.asset(IconPath.user, scale: 4).marginOnly(right: 5),

                    // name
                    Expanded(
                      child: Text(
                        clientName,
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ).marginOnly(bottom: 16),

                // client phone number
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // phone icon
                    Image.asset(IconPath.call, scale: 4).marginOnly(right: 5),

                    // number
                    Expanded(
                      child: Text(
                        phoneNumber,
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ).marginOnly(bottom: 16),

                // client location
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // location icon
                    Image.asset(IconPath.location, scale: 4).marginOnly(right: 5),

                    // location
                    Expanded(
                      child: Text(
                        location,
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ).marginOnly(bottom: 16),
              ],
            ).marginSymmetric(horizontal: 10,),

            // message to customer
            Text(
              AppText.orderDetailsScreenMessageToCustomer,
              style: getTextStyle(
                fontFamily: 'bricolage',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.grey,
              ),
            ).marginOnly(bottom: 20),
            Text(
              'Let me know your preferred time, and I\'ll schedule the refrigeration servicing accordingly.',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
              style: getTextStyle(
                fontFamily: 'bricolage',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.secondary,
              ),
            ).marginSymmetric(horizontal: 10),

            // order position
            Align(
              alignment: Alignment.center,
              child: Text(
                AppText.orderDetailsScreenOrderPosition,
                style: getTextStyle(
                  fontFamily: 'bricolage',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: majorTextColor,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ).marginOnly(bottom: 16),
            ),

            // order position buttons
            InnerShadow(
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  offset: Offset(2, 0),
                  blurRadius: 8,
                ),
              ],
              child: Card(
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: majorTextColor,
                  ),

                  child: InkWell(
                    onTap:
                        () => Get.find<OrderScreenController>()
                        .changeOrderPositionVisibility(
                      !Get.find<OrderScreenController>()
                          .orderPositionVisibility
                          .value,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // button label
                        Text(
                          'New',
                          style: getTextStyle(
                            fontFamily: 'bricolage',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),

                        // icon
                        Obx(() {
                          return Icon(
                            Get.find<OrderScreenController>()
                                .orderPositionVisibility
                                .value
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ).marginOnly(bottom: 6),

            Obx(
                  () =>Get.find<OrderScreenController>().orderPositionVisibility.value ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // process button
                  CustomSubmitButton(
                    hintText: 'Process',
                    color: AppColors.accent,
                    innerShadow: true,
                  ).marginOnly(bottom: 6),
                  CustomSubmitButton(
                    hintText: 'Complete',
                    color: AppColors.success,
                    innerShadow: true,
                  ).marginOnly(bottom: 6),
                  CustomSubmitButton(
                    hintText: 'Cancel',
                    color: AppColors.error,
                    innerShadow: true,
                  ).marginOnly(bottom: 16),
                ],
              ) : SizedBox(),
            ),
          ],
        ).marginSymmetric(horizontal: 16),
      ),
    );
  }
}
