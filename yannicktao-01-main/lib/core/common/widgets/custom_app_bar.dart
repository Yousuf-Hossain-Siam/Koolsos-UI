import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_texts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/icon_path.dart';
import '../styles/global_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondary,
      centerTitle: false,
      leadingWidth: 150,
      leading: Text(
        AppText.appName,
        style: getTextStyle(
          fontFamily: 'bricolage',
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: AppColors.primary,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 4.0,
              color: Colors.white.withValues(alpha: 0.3),
            ),
          ],
        ),
      ).marginOnly(left: 15),
      actions: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withValues(alpha: 0.1),
          ),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(IconPath.belllogo),
              ),
              Positioned(
                right: 15,
                top: 10,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ).marginOnly(right: 15).paddingOnly(bottom: 10),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
