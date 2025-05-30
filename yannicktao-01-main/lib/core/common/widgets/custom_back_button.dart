import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/icon_path.dart';
import '../styles/global_text_style.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: [
          Image.asset(IconPath.back, scale: 5).marginOnly(top: 12, right: 5),
          Text(
            'Back',
            style: getTextStyle(
              fontSize: 14,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.w500,
            ),
          ).marginOnly(top: 10),
        ],
      ),
    );
  }
}
