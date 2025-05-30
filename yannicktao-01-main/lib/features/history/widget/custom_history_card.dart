import 'package:flutter/material.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';

import '../../../core/common/styles/global_text_style.dart';

class CustomHistoryCard extends StatelessWidget {
  const CustomHistoryCard({
    super.key,
    required this.sl,
    required this.orderNo,
    required this.consumerName,
    required this.date, required this.time,
  });

  final String sl;
  final String orderNo;
  final String consumerName;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      width: double.infinity,

      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.2), width: 1)
        )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            sl,
            style: getTextStyle(
              fontFamily: 'bricolage',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
               orderNo,
                style: getTextStyle(
                  fontFamily: 'bricolage',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                consumerName,
                style: getTextStyle(
                  fontFamily: 'bricolage',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    time,
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.success
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
