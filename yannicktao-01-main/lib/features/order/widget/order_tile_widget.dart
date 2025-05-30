import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/order/screen/order_details_screen.dart';

import '../../../core/utils/constants/icon_path.dart';

class OrderTileWidget extends StatelessWidget {
  const OrderTileWidget({
    super.key,
    required this.serialNumber,
    required this.orderNumber,
    required this.orderName,
    required this.clientName,
    required this.phoneNumber,
    required this.location,
    required this.orderStatus,
    required this.color,
    required this.majorTextColor,
  });

  final String serialNumber;
  final String orderNumber;
  final String orderName;
  final String clientName;
  final String phoneNumber;
  final String location;
  final String orderStatus;
  final Color color;
  final Color majorTextColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap:
      //     () => Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder:
      //             (_) => OrderDetailsScreen(
      //               serialNumber: serialNumber,
      //               orderNumber: orderNumber,
      //               orderName: orderName,
      //               clientName: clientName,
      //               phoneNumber: phoneNumber,
      //               location: location,
      //               orderStatus: orderStatus,
      //               majorTextColor: majorTextColor,
      //             ),
      //       ),
      //     ),
      onTap: () => PersistentNavBarNavigator.pushNewScreen(context, screen: OrderDetailsScreen(serialNumber: serialNumber,
        orderNumber: orderNumber,
        orderName: orderName,
        clientName: clientName,
        phoneNumber: phoneNumber,
        location: location,
        orderStatus: orderStatus,
        majorTextColor: majorTextColor,)),
      child: Container(
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Stack(
          children: [
            // half circle design
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                ),
                child: Image.asset(IconPath.ellipse, color: color, scale: 2.5),
              ),
            ),

            // order info
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // sl number and status indicator
                Row(
                  children: [
                    Expanded(
                      child: RichText(
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
                      ),
                    ),

                    // order status
                    InnerShadow(
                      shadows: [
                        Shadow(
                          color: majorTextColor.withValues(alpha: 0.4),
                          offset: Offset(2, 1),
                          blurRadius: 7,
                        ),
                      ],
                      child: Container(
                        height: 25,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          orderStatus,
                          style: getTextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: majorTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

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
                ),

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
                ),

                // divider
                Divider(
                  color: majorTextColor.withValues(alpha: 0.2),
                  thickness: 1,
                ),

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
                ),

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
                ),

                // client location
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // location icon
                    Image.asset(
                      IconPath.location,
                      scale: 4,
                    ).marginOnly(right: 5),

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
                ),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
