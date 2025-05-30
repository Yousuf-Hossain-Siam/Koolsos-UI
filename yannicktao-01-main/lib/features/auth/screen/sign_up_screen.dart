import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/utils/constants/sizer.dart';
import 'package:yannicktao/features/auth/widget/custom_text_field.dart';
import 'package:yannicktao/features/password/widget/custom_dialog_box.dart';
import 'package:yannicktao/routes/app_routes.dart';

import '../../../core/common/widgets/custom_submit_button.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/colors.dart';
import '../controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _showConfirmationBottomSheet(
    BuildContext context,
    TextEditingController controller,
  ) {
    CustomDialogBox.otpSendDialogBox(
      context,
      Get.find<AuthController>().otpController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top
          SizedBox(
            height: context.height < AppScreenSize.smallScreen ? 70 : 200,
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
                    //subtitle
                    Text(
                      AppText.appSignupTitle,
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

                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: [
                          // name fields
                          CustomTextField(
                            controller:
                                Get.find<AuthController>().fullNameController,
                            hintText: AppText.appSignupUserNameHint,
                          ).paddingOnly(bottom: 12),

                          // phone number
                          CustomTextField(
                            controller:
                                Get.find<AuthController>()
                                    .phoneNumberController,
                            hintText: AppText.appSignupPhoneNumberHint,
                          ).paddingOnly(bottom: 12),

                          // email field
                          CustomTextField(
                            controller:
                                Get.find<AuthController>().emailController,
                            hintText: AppText.appSignUpEmailHint,
                          ).paddingOnly(bottom: 12),

                          // phone number
                          CustomTextField(
                            controller:
                                Get.find<AuthController>()
                                    .newPasswordController,
                            hintText: AppText.appSignUpPasswordHint,
                          ).paddingOnly(bottom: 12),

                          // phone number
                          CustomTextField(
                            controller:
                                Get.find<AuthController>()
                                    .confirmPasswordController,
                            hintText: AppText.appSignUpConfirmPasswordHint,
                          ),
                        ],
                      ),
                    ),

                    // checkbox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap:
                                () => Get.find<AuthController>()
                                    .toggleTermsAndConditionsCheckBox(
                                      !Get.find<AuthController>()
                                          .termsAndConditionsIsChecked
                                          .value,
                                    ),
                            child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),

                              child:
                                  Get.find<AuthController>()
                                          .termsAndConditionsIsChecked
                                          .value
                                      ? Icon(Icons.check, size: 13)
                                      : SizedBox(),
                            ),
                          ).marginOnly(left: 15);
                        }),
                        Expanded(
                          child: Text(
                            AppText.appSignUpCheckBox,
                            style: getTextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ).marginOnly(left: 10),
                        ),
                      ],
                    ).marginOnly(left: 5, right: 5, bottom: 15, top: 16),

                    // submit button
                    InkWell(
                      onTap:
                          () => _showConfirmationBottomSheet(
                            context,
                            Get.find<AuthController>().otpController,
                          ),
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
