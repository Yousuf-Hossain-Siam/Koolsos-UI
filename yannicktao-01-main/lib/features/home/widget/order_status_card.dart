import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/utils/constants/icon_path.dart';
import 'package:yannicktao/core/utils/constants/sizer.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.cardColor,
    required this.itemNumber,
    required this.imagePath,
    required this.cardTitle,
  });

  final Color cardColor;
  final int itemNumber;
  final String imagePath;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2), // Shadow color
            offset: const Offset(2, 3), // Shadow position
            blurRadius: 2, // Shadow spread
            spreadRadius: 2, // How much the shadow spreads
          ),
        ],
      ),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cardColor),
          color: cardColor.withValues(alpha: 0.1),
        ),

        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                child: Image.asset(
                  IconPath.ellipse,
                  color: cardColor.withValues(alpha: 0.1),
                  scale: 3.5,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  overflow: TextOverflow.ellipsis,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ).marginOnly(top: 12, left: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      itemNumber.toString(),
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: cardColor,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2), // X and Y offset
                            blurRadius: 4.0, // Softness of the shadow
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ],
                      ),
                    ).marginOnly(top: 16, left: 16),

                    Image.asset(imagePath, height: 40).marginOnly(
                      top: context.height < AppScreenSize.smallScreen ? 12 : 20,
                      right: 10,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
