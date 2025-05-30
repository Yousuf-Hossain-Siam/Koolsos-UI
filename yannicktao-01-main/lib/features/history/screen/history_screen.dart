import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/common/widgets/custom_back_button.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/features/history/widget/custom_history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, this.isBottomNav = true});

  final bool isBottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // title
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

              // isBottomNav ? SizedBox() : CustomBackButton(),
            ],
          ),

          // order list
          Container(
            height: 45,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primary50,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sl',
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Order no',
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Consumer Name',
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Date & Time',
                      style: getTextStyle(
                        fontFamily: 'bricolage',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemCount: 4,
              itemBuilder:
                  (context, index) => CustomHistoryCard(
                sl: index.toString(),
                orderNo: '#TY566',
                consumerName: 'John Mitchell',
                date: '22-Dec-20',
                time: '10:54 PM',
              ).marginSymmetric(horizontal: 8),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
