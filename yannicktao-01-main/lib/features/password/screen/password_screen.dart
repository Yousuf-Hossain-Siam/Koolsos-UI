import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/common/widgets/custom_submit_button.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/password/controller/password_controller.dart';
import 'package:yannicktao/features/password/widget/custom_dialog_box.dart';
import 'package:yannicktao/features/profile/widgets/edit_text_field.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/common/widgets/custom_back_button.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../routes/app_routes.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Expanded(
            child: Column(
              children: [
                // title and back button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        AppText.historyTitle,
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ).marginOnly(top: 24, bottom: 16),
                    ),

                    // CustomBackButton(),
                  ],
                ),

                // old password
                EditTextField(
                  title: 'Old Password',
                  controller: Get.find<PasswordController>().oldPasswordController,
                  hintText: '******',
                ),

                // new password
                EditTextField(
                  title: 'New Password',
                  controller: Get.find<PasswordController>().newPasswordController,
                  hintText: '******',
                ),

                // confirm password
                EditTextField(
                  title: 'Confirm Password',
                  controller: Get.find<PasswordController>().confirmPasswordController,
                  hintText: '******',
                ),

                // remember me and forgot password section
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
                                  () => Get.find<PasswordController>()
                                  .rememberMeCheckBoxValue(
                                !Get.find<PasswordController>()
                                    .rememberMeCheckBoxValue
                                    .value,
                              ),
                              child: Container(
                                height: 20,
                                width: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Get.find<PasswordController>().rememberMeCheckBoxValue.value ? AppColors.success: Colors.black, width: 1.3),
                                  borderRadius: BorderRadius.circular(7),
                                ),

                                child:
                                Get.find<PasswordController>()
                                    .rememberMeCheckBoxValue
                                    .value
                                    ? Icon(Icons.check, color: Get.find<PasswordController>().rememberMeCheckBoxValue.value ? AppColors.success: Colors.black, size: 13,)
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
                          ).marginOnly(left: 5),
                        ],
                      ),
                    ),

                    TextButton(
                      onPressed: () => Get.toNamed(AppRoute.forgotPasswordScreen),
                      child: Text(
                        AppText.appForgotPassword,
                        style: getTextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                ).marginOnly(bottom: 12, left: 5, right: 5),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              CustomDialogBox.otpSendDialogBox(context, Get.find<PasswordController>().otpController);
            },
            child: CustomSubmitButton(
              hintText: AppText.appLoginSubmit,
              color: AppColors.accent,
              innerShadow: true,
            ),
          ).marginOnly(bottom: 16),
        ],
      ).marginSymmetric(horizontal: 16),
    );
  }
}
