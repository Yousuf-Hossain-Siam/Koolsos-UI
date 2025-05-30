
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({super.key, required this.title, this.marginBottom = 24, required this.icon});

  final String title;
  final String icon;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon, height: 18,).marginOnly(right: 8),
        Expanded(
          child: Text(
            title,
            style: getTextStyle(
              fontFamily: 'bricolage',
              fontWeight: FontWeight.w400,
              fontSize: 16
            ),
          ),
        ),
      ],
    ).marginOnly(bottom: marginBottom ?? 24);
  }
}
