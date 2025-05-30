import 'package:flutter/material.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';

import '../../utils/constants/colors.dart';

class CustomShadowGreenButton extends StatelessWidget {
  const CustomShadowGreenButton({super.key, required this.title, this.backgroundColor = AppColors.success, this.textColor = Colors.white});

  final String title;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.3)),
          BoxShadow(
            color: backgroundColor!,
            spreadRadius: 1.0,
            blurRadius: 1.0,
          ),
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 2,
            offset: Offset(2, 2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Text(
            title,
            style: getTextStyle(
              color: textColor!,
              fontSize: 10,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
