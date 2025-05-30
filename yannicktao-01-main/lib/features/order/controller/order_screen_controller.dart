import 'package:get/get.dart';

import '../../../core/utils/constants/app_texts.dart';

class OrderScreenController extends GetxController {
  RxString orderDurationController = AppText.homeScreenDropDownWeakTitle.obs;
  RxBool orderPositionVisibility = false.obs;

  List<String> orderDurationDropdownList = [AppText.homeScreenDropDownWeakTitle, AppText.homeScreenDropDownMonthTitle, AppText.homeScreenDropDownYearTitle];


  void changeOrderDuration(String value) => orderDurationController.value = value;
  void changeOrderPositionVisibility(bool value) => orderPositionVisibility.value = value;

}