import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/common/widgets/custom_submit_button.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/auth/controller/auth_controller.dart';
import 'package:yannicktao/features/auth/widget/custom_text_field.dart';
import 'package:yannicktao/routes/app_routes.dart';

import '../../../core/utils/constants/sizer.dart';
import 'package:easy_radio/easy_radio.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // top
          Container(
            color: Colors.white,
            height: context.height < AppScreenSize.smallScreen ? 140 : 300,
            child: Stack(
              children: [
                Positioned(
                  bottom: context.height < AppScreenSize.mediumScreen ? 10 : 50,
                  right: context.height < AppScreenSize.mediumScreen ? 10 : 50,
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
          ).marginOnly(
            bottom: context.height < AppScreenSize.smallScreen ? 10 : 40,
            top: context.height < AppScreenSize.smallScreen ? 10 : 40,
          ),

          //bottom
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 32,
                // left: 16,
                // right: 16,
              ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // login text
                    Text(
                      AppText.appLoginTitle,
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2), // X and Y offset
                            blurRadius: 4.0, // Softness of the shadow
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        ],
                      ),
                    ).marginOnly(bottom: 24),

                    // email text field
                    CustomTextField(
                      controller: Get.find<AuthController>().emailController,
                      hintText: AppText.appEmailHint,
                    ).marginOnly(left: 16, right: 16, bottom: 12),

                    // password
                    CustomTextField(
                      controller: Get.find<AuthController>().emailController,
                      hintText: AppText.appPasswordHint,
                    ).marginOnly(left: 16, right: 16, bottom: 12),

                    // forgot password section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // checkbox
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(() {
                                return GestureDetector(
                                  onTap:
                                      () => Get.find<AuthController>()
                                          .toggleRememberMeCheckBox(
                                            !Get.find<AuthController>()
                                                .rememberMeIsChecked
                                                .value,
                                          ),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black, width: 1.3),
                                      borderRadius: BorderRadius.circular(7),
                                    ),

                                    child:
                                        Get.find<AuthController>()
                                                .rememberMeIsChecked
                                                .value
                                            ? Icon(Icons.check, size: 13,)
                                            : SizedBox(),
                                  ),
                                ).marginOnly(left: 15);
                              }),
                              Text(
                                AppText.appLoginCheckBox,
                                style: getTextStyle(
                                  fontFamily: 'montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ).marginOnly(left: 10),
                            ],
                          ),
                        ),

                        TextButton(
                          onPressed:
                              () => Get.toNamed(AppRoute.forgotPasswordScreen),
                          child: Text(
                            AppText.appForgotPassword,
                            style: getTextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(bottom: 12, left: 5, right: 5),

                    // submit button
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: InkWell(
                        onTap:
                            () => Get.offAllNamed(
                              AppRoute.customBottomNavBarScreen,
                            ),
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

          // forgot password section
        ],
      ),
    );
  }
}
