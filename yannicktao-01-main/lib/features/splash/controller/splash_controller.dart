import 'package:get/get.dart';
import 'package:yannicktao/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    splashScreenDelay();
  }

  void splashScreenDelay() {
    Future.delayed(const Duration(seconds: 2), () => Get.offAllNamed(AppRoute.loginScreen));
  }
}