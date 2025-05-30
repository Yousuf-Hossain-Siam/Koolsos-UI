import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxBool rememberMeCheckBoxValue = false.obs;

  RxInt currentPage = 0.obs;

  void changeRememberMeCheckBoxValue(bool value) => rememberMeCheckBoxValue.value = value;

  void changeCurrentPage(int value) => currentPage.value = value;
}