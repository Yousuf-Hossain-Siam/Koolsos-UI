import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/common/widgets/custom_shadow_green_button.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/core/utils/constants/icon_path.dart';
import 'package:yannicktao/features/activation/screens/activation_screen.dart';
import 'package:yannicktao/features/history/screen/history_screen.dart';
import 'package:yannicktao/features/password/screen/password_screen.dart';
import 'package:yannicktao/features/profile/screens/edit_profile_screen.dart';
import 'package:yannicktao/features/profile/widgets/location_card.dart';
import 'package:yannicktao/features/profile/widgets/menu_item_card.dart';
import 'package:yannicktao/features/subscription/screens/subscription_plan_screen.dart';
import 'package:yannicktao/features/terms_and_condition/screens/trems_and_condition_screen.dart';
import 'package:yannicktao/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile image, name, email section
            SizedBox(
              height: 125,
              width: double.maxFinite,

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Apply border radius here
                    child: SizedBox(
                      height: context.height * 0.12,
                      width: context.width * 0.23,
                      child: Image.network(
                        'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // user details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // business name
                        Text(
                          'Business Name',
                          style: getTextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // person name
                        Text(
                          'Johnson Rush',
                          style: getTextStyle(
                            fontFamily: 'bricolage',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accent,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                offset: Offset(2, 2),
                                blurRadius: 5
                              )
                            ]
                          ),
                        ),

                        // user email
                        Text(
                          'Jyourmail@gmail.com',
                          style: getTextStyle(
                            fontFamily: 'montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // edit profile button
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditProfileScreen(),
                                ),
                              ),
                          child: InnerShadow(
                            shadows: [
                              Shadow(
                                color: AppColors.accent.withValues(alpha: 0.4),
                                offset: Offset(0, 0),
                                blurRadius: 8,
                              ),
                            ],
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF1FAFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 0,
                                    offset: Offset(2, 2),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 8,
                                children: [
                                  Text(
                                    AppText.editButtonTitle,
                                    style: getTextStyle(
                                      color: const Color(0xFF009DE8),
                                      fontSize: 10,
                                      fontFamily: 'bricolage',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(left: 12),
                  ),

                  // active status button
                  InkWell(
                    onTap:
                        () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: ActivationScreen(),
                        ),
                    child: CustomShadowGreenButton(title: 'Active'),
                  ),
                ],
              ),
            ).marginOnly(top: 24),

            // user selected location
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                ).marginOnly(right: 5),
                Expanded(
                  child: Text(
                    AppText.selectServiceAreaTitle,
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.success,
                    ),
                  ),
                ),
              ],
            ).marginOnly(top: 16),
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              runSpacing: 8,
              spacing: 8,
              children: [
                LocationCard(
                  title: '350 5th Ave',
                  backgroundColor: AppColors.accent,
                ),
                LocationCard(
                  title: '1 World Trade Center',
                  backgroundColor: AppColors.success.withValues(alpha: 0.5),
                ),
                LocationCard(
                  title: '742 Madison',
                  backgroundColor: Color(0x80FF3600),
                ),
                LocationCard(
                  title: '5th Ave & E 42nd St',
                  backgroundColor: Color(0x80FFCC00),
                ),
              ],
            ).marginOnly(top: 12),

            // horizontal line
            Divider(
              color: Colors.grey.withValues(alpha: 0.2),
            ).marginOnly(top: 24),

            // menus
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // history
                InkWell(
                  onTap:
                      () => PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: HistoryScreen(isBottomNav: false),
                      ),
                  child: MenuItemCard(
                    title: AppText.profileScreenMenuItemHistory,
                    icon: IconPath.history,
                  ),
                ),

                InkWell(
                  onTap:
                      () => PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: PasswordScreen(),
                      ),
                  child: MenuItemCard(
                    title: AppText.profileScreenMenuItemPassword,
                    icon: IconPath.password,
                  ),
                ),
                InkWell(
                  onTap:
                      () => PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: TermsAndConditionScreen(),
                      ),
                  child: MenuItemCard(
                    title: AppText.profileScreenMenuItemTermsAndCondition,
                    icon: IconPath.termsAndCondition,
                  ),
                ),
                InkWell(
                  onTap:
                      () => PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: TermsAndConditionScreen(isPrivacyPolicy: true,),
                      ),
                  child: MenuItemCard(
                    title: AppText.profileScreenMenuItemPrivacyPolicy,
                    icon: IconPath.termsAndCondition,
                  ),
                ),
                InkWell(
                  onTap: () => Get.offAllNamed(AppRoute.loginScreen),
                  child: MenuItemCard(
                    title: AppText.profileScreenMenuItemLogOut,
                    icon: IconPath.logout,
                  ),
                ),
              ],
            ).marginOnly(top: 24),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
