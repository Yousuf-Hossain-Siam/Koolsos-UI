import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  // text field controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  // checkbox
  RxBool rememberMeIsChecked = false.obs;
  RxBool termsAndConditionsIsChecked = false.obs;

  void toggleRememberMeCheckBox(bool? value) {
    rememberMeIsChecked.value = value ?? false;
  }

  void toggleTermsAndConditionsCheckBox(bool? value) {
    termsAndConditionsIsChecked.value = value ?? false;
  }

}
