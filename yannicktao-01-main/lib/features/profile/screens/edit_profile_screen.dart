import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/widgets/custom_app_bar.dart';
import 'package:yannicktao/core/common/widgets/custom_back_button.dart';
import 'package:yannicktao/core/utils/constants/app_texts.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/core/utils/constants/icon_path.dart';
import 'package:yannicktao/features/profile/controller/profile_controller.dart';
import 'package:yannicktao/features/profile/widgets/edit_text_field.dart';
import 'package:yannicktao/features/profile/widgets/location_card.dart';

import '../../../core/common/styles/global_text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile image
            // Container(
            //   width: double.infinity,
            //   alignment: Alignment.centerRight,
            //   child: SizedBox(
            //       width: 100,
            //       child: CustomBackButton(),
            // )),
            Obx(() {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: 180,
                  height: 180,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child:
                            Get.find<ProfileController>().profileImage.value !=
                                    null
                                ? SizedBox(
                              height: 180,
                                  width: 180,
                                  child: Image.file(
                                    Get.find<ProfileController>()
                                        .profileImage
                                        .value!, fit: BoxFit.cover,
                                  ),
                                )
                                : Image.network(
                                  'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
                                  height: context.height * 0.20,
                                ),
                      ),

                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: InkWell(
                          onTap:
                              () =>
                                  Get.find<ProfileController>()
                                      .pickImageFromGallery(),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Image.asset(IconPath.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).marginOnly(top: 16),
              );
            }),

            // text fields
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // full name
                EditTextField(
                  title: AppText.fullName,
                  controller: Get.find<ProfileController>().fullNameController,
                  hintText: AppText.fullNameHint,
                ),

                EditTextField(
                  title: AppText.businessName,
                  controller:
                      Get.find<ProfileController>().businessNameController,
                  hintText: AppText.businessNameHint,
                ),

                // mail
                EditTextField(
                  title: AppText.mail,
                  controller: Get.find<ProfileController>().emailController,
                  hintText: AppText.mailHint,
                ),

                // mobile number
                EditTextField(
                  title: AppText.mobileNumber,
                  controller:
                      Get.find<ProfileController>().mobileNumberController,
                  hintText: AppText.mobileNumberHint,
                ),

                EditTextField(
                  title: AppText.businessLocation,
                  controller:
                      Get.find<ProfileController>().businessLocationController,
                  hintText: AppText.businessLocationHint,
                ),
              ],
            ).marginOnly(top: 24),

            // select service
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    title: Text(AppText.repairRefrigeration),
                    value: AppText.repairRefrigeration,
                    groupValue: Get.find<ProfileController>().service.value,
                    onChanged: (value) {
                      Get.find<ProfileController>().selectService(value!);
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(AppText.appliance),
                    value: AppText.appliance,
                    groupValue: Get.find<ProfileController>().service.value,
                    onChanged: (value) {
                      Get.find<ProfileController>().selectService(value!);
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(AppText.refrigeration),
                    value: AppText.refrigeration,
                    groupValue: Get.find<ProfileController>().service.value,
                    onChanged: (value) {
                      Get.find<ProfileController>().selectService(value!);
                    },
                  ),
                ],
              );
            }),

            // service area
            EditTextField(
              marginBottom: 0,
              title: AppText.serviceAreaTitle,
              controller: Get.find<ProfileController>().serviceAreaController,
              hintText: AppText.serviceAreaTitle,
              suffix: InkWell(
                onTap:
                    () => Get.find<ProfileController>().addServiceArea(
                      Get.find<ProfileController>()
                          .serviceAreaController
                          .value
                          .text,
                    ),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: AppColors.success),
                ).marginOnly(bottom: 10),
              ),
            ).marginOnly(bottom: 8),

            // service area location
            // LocationCard(
            //   title: '1 World Trade Center',
            //   backgroundColor: Colors.grey.shade300,
            // ),
            Obx(() {
              return Wrap(
                children:
                    Get.find<ProfileController>().serviceArea.value
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),

                              color: Color(0x1A27426A),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Text(
                                  e,
                                  style: getTextStyle(
                                    color: const Color(0xFF262D2C),
                                    fontSize: 10,
                                    fontFamily: 'bricolage',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                InkWell(
                                  onTap: () => Get.find<ProfileController>().removeServiceArea(e),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              );
            }),

            const SizedBox(height: 24),
          ],
        ).marginSymmetric(horizontal: 16),
      ),
    );
  }
}
