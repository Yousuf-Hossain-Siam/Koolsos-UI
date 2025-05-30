import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/features/password/widget/custom_dialog_box.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/common/widgets/custom_submit_button.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizer.dart';
import '../../../routes/app_routes.dart';
import '../controller/auth_controller.dart';
import '../widget/custom_text_field.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top
          SizedBox(
            height: context.height < AppScreenSize.smallScreen ? 70 : 250,
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

          // app name
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
          ).marginOnly(
            bottom: context.height < AppScreenSize.smallScreen ? 20 : 40,
            top: context.height < AppScreenSize.smallScreen ? 10 : 40,
          ),

          // bottom
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //title
                    Text(
                      AppText.appChangePasswordTitle,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 22,
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
                    ).marginOnly(left: 50, right: 50, bottom: 24),

                    // subtitle
                    Text(
                      AppText.appChangePasswordSubTitle,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ).marginOnly(bottom: 24),

                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: [
                          // old password
                          CustomTextField(
                            controller:
                                Get.find<AuthController>().passwordController,
                            hintText: AppText.appEmailHint,
                          ).paddingOnly(bottom: 12),

                          // new password
                          CustomTextField(
                            controller:
                                Get.find<AuthController>()
                                    .newPasswordController,
                            hintText: AppText.appChangePasswordNew,
                          ).paddingOnly(bottom: 12),
                        ],
                      ),
                    ),

                    //warning
                    Text(
                      AppText.appChangePasswordWarning,
                      textAlign: TextAlign.start,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ).marginOnly(bottom: 24, left: 16, right: 16),

                    // submit button
                    InkWell(
                      onTap: () => CustomDialogBox.otpSendDialogBox(context, Get.find<AuthController>().otpController),
                      child: CustomSubmitButton(
                        hintText: AppText.appLoginSubmit,
                      ).paddingSymmetric(horizontal: 16),
                    ),

                    // sign in
                    InkWell(
                      onTap: () => Get.toNamed(AppRoute.loginScreen),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppText.appSignUpHaveAccount,
                              style: getTextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: AppText.appSignUpSignIn,
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
