
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../core/common/widgets/custom_submit_button.dart';
import '../../../core/utils/constants/app_texts.dart';
import '../../../core/utils/constants/colors.dart';

class CustomDialogBox {
  CustomDialogBox._();

  static void otpSendDialogBox(BuildContext context, TextEditingController controller) {
    showDialog(context: context, builder: (context) {
      return Dialog(
        child: Container(
          height: 280,
          width: 360,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
          ),

          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // title
                    Text(
                      AppText.appSignUpVerificationCodeTitle,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent,
                      ),
                    ),

                    // subtitle
                    Text(
                      AppText.appSignUpVerificationCodeSubtitle,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // user email
                    Text(
                      'test12@gmail.com',
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.success,
                      ),
                    ),

                    // submit button
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        otpVerifyDialogBox(context, controller);
                      },
                      child: CustomSubmitButton(
                        hintText: AppText.appLoginSubmit,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }

  static void otpVerifyDialogBox(BuildContext context, TextEditingController controller) {
    showDialog(context: context, builder: (context) {
      return Dialog(
        child: Container(
          height: 360,
          width: 360,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // title
                    Text(
                      AppText.appSignUpVerificationCodeTitle,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent,
                      ),
                    ),
                
                    // subtitle
                    Text(
                      AppText
                          .appSignUpVerificationCode2ndScreenSubTitle,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                
                    // user email
                    Text(
                      'test12@gmail.com',
                      textAlign: TextAlign.center,
                      style: getTextStyle(
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.success,
                      ),
                    ),
                
                    // otp input fields
                    PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      length: 4,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 55,
                        fieldWidth: 45,
                        activeFillColor: AppColors.primary50,
                        inactiveFillColor: AppColors.primary50,
                        selectedFillColor: AppColors.primary50,
                        activeColor: Colors.transparent,
                        inactiveColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                      ),
                      autoDismissKeyboard: true,
                      enablePinAutofill: true,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(2, 2),
                          color: Colors.black,
                          blurRadius: 10,
                        ),
                      ],
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      cursorColor: Colors.black,
                      onChanged: (value) {},
                      controller: controller,
                      onCompleted: (value) {
                        debugPrint("Completed: $value");
                      },
                
                      keyboardType: TextInputType.number,
                    ),
                
                    // resend code
                    InkWell(
                      onTap: () {
                        //
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                              AppText
                                  .appSignUpVerificationDonTGetCode,
                              style: getTextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text:
                              AppText
                                  .appSignUpVerificationResendCode,
                              style: getTextStyle(
                                fontFamily: 'montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                
                    // submit button
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CustomSubmitButton(
                        hintText: AppText.appLoginSubmit,
                      ),
                    ).marginOnly(top: 10),
                  ],
                ),
              ).marginAll(40),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}