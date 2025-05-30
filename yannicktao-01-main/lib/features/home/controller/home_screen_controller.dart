
import 'package:get/get.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';

class HomeScreenController extends GetxController {
  RxString orderDurationController = AppText.homeScreenDropDownWeakTitle.obs;
  RxString earningDurationController = AppText.homeScreenDropDownWeakTitle.obs;

  List<String> orderDurationDropdownList = [AppText.homeScreenDropDownWeakTitle, AppText.homeScreenDropDownMonthTitle, AppText.homeScreenDropDownYearTitle];
  List<String> earningDurationDropdownList = [AppText.homeScreenDropDownWeakTitle, AppText.homeScreenDropDownMonthTitle, AppText.homeScreenDropDownYearTitle];

  void changeOrderDuration(String value) => orderDurationController.value = value;
  void changeEarningDuration(String value) => earningDurationController.value = value;
}