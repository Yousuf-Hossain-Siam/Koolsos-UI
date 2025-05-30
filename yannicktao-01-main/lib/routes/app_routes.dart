import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yannicktao/features/auth/screen/forgot_password_screen.dart';
import 'package:yannicktao/features/auth/screen/login_screen.dart';
import 'package:yannicktao/features/auth/screen/set_new_password.dart';
import 'package:yannicktao/features/auth/screen/sign_up_screen.dart';
import 'package:yannicktao/features/custom_bottom_nav_bar/screen/custom_bottom_nav_bar.dart';
import 'package:yannicktao/features/splash/screen/splash_screen.dart';

class AppRoute {
  static String splashScreen = "/splashScreen";
  static String loginScreen = "/loginScreen";
  static String signupScreen = "/signupScreen";
  static String forgotPasswordScreen = "/forgotPasswordScreen";
  static String subscription3 = "/subscription3";
  static String changePasswordScreen = "/changePasswordScreen";

  // bottom nav bar
  static String customBottomNavBarScreen = "/customBottomNavBarScreen";

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignupScreen() => signupScreen;
  static String getForgotPasswordScreen() => forgotPasswordScreen;
  static String getSubscription3() => subscription3;
  static String getChangePasswordScreen() => changePasswordScreen;

  // bottom nav bar
  static String getCustomBottomNavBar() => customBottomNavBarScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signupScreen, page: () => SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: changePasswordScreen, page: () => SetNewPassword()),

    // bottom nav bar
    GetPage(name: customBottomNavBarScreen, page: () => CustomBottomNavBar()),
  ];
}
