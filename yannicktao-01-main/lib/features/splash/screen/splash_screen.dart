import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top
          Expanded(
            child:  Stack(
              children: [
                Positioned(
                  bottom:
                  context.height < AppScreenSize.mediumScreen ? 10 : 10,
                  right: context.height < AppScreenSize.mediumScreen ? 10 : 0,
                  child: Container(
                    height: 784,
                    width: 784,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5FCFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // app name
          Text(
            AppText.appName,
            style: getTextStyle(
              fontFamily: 'bricolage',
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              shadows: [
                Shadow(
                  offset: Offset(2, 2), // X and Y offset
                  blurRadius: 4.0, // Softness of the shadow
                  color: Colors.black.withValues(alpha: 0.3),
                ),
              ],
            ),
          ),

          // bottom
          Expanded(
            child:  Stack(
              children: [
                Positioned(
                  top:
                  context.height < AppScreenSize.mediumScreen ? 10 : 10,
                  left: context.height < AppScreenSize.mediumScreen ? 10 : 0,
                  child: Container(
                    height: 784,
                    width: 784,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5FCFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
