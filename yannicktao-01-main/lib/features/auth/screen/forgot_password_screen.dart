import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/features/auth/controller/auth_controller.dart';
import '../../../core/common/widgets/custom_submit_button.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizer.dart';
import '../../../routes/app_routes.dart';
import '../widget/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top
          SizedBox(
            height: context.height < AppScreenSize.smallScreen ? 120 : 350,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
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

          // brand name
          Text(
            AppText.appName,
            style: getTextStyle(
              fontFamily: 'bricolage',
              color: AppColors.textTitlePrimary,
              fontSize: 48,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(2, 2), // X and Y offset
                  blurRadius: 4.0, // Softness of the shadow
                  color: Colors.black.withValues(alpha: 0.3),
                ),
              ],
            ),
          ).paddingOnly(bottom: 40),

          //bottom
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // forgot text
                    Text(
                      AppText.appForgotPasswordTitle,
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2), // X and Y offset
                            blurRadius: 4.0, // Softness of the shadow
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ],
                      ),
                    ).marginOnly(top: 22),

                    Text(
                      AppText.appForgotPasswordSubTitle,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ).marginOnly(top: 24),

                    const SizedBox(height: 24),

                    // email text field
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: CustomTextField(
                        controller: Get.find<AuthController>().emailController,
                        hintText: AppText.appEmailHint,
                      ),
                    ),

                    const SizedBox(height: 12),
                    Text(
                      'test12@gmail.com',
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // submit button
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: InkWell(
                        onTap: () => Get.toNamed(AppRoute.changePasswordScreen),
                        child: CustomSubmitButton(
                          hintText: AppText.appLoginSubmit,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () => Get.toNamed(AppRoute.signupScreen),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppText.appLoginDontHaveAccount,
                              style: getTextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: AppText.appLoginCreateAccount,
                              style: getTextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).marginOnly(top: 20, bottom: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
