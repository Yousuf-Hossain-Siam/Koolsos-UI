import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  RxInt subscriptionPlanDuration = 6.obs;
  RxInt subscriptionPlanAmount = 48.obs;
  RxBool subscriptionAutoRenew = false.obs;

  void changeSubscriptionPlanDuration(int duration, int amount) {
    subscriptionPlanDuration.value = duration;
    subscriptionPlanAmount.value = amount;
  }

  void changeSubscriptionAutoRenew(bool value) => subscriptionAutoRenew.value = value;
}