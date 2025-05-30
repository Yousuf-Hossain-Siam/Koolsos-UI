import 'package:get/get.dart';
import 'package:yannicktao/features/auth/controller/auth_controller.dart';
import 'package:yannicktao/features/home/controller/home_screen_controller.dart';
import 'package:yannicktao/features/order/controller/order_screen_controller.dart';
import 'package:yannicktao/features/password/controller/password_controller.dart';
import 'package:yannicktao/features/profile/controller/profile_controller.dart';
import 'package:yannicktao/features/splash/controller/splash_controller.dart';
import 'package:yannicktao/features/stripe/stripe_controller.dart';
import 'package:yannicktao/features/subscription/controller/subscription_screen_controller.dart';

Future<void> init() async {
  Get.put(AuthController());
  Get.put(SubscriptionController());
  Get.put(SplashController());
  Get.put(ProfileController());
  Get.put(HomeScreenController());
  Get.put(PasswordController());
  Get.put(StripeController());
  Get.put(OrderScreenController());
}