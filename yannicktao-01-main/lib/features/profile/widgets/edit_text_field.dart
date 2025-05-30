import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.suffix = const SizedBox(),
    this.marginBottom = 24,
  });

  final String title;
  final TextEditingController controller;
  final String hintText;
  final Widget? suffix;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          '$title*',
          style: getTextStyle(
            fontFamily: 'Montserrat',
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ).marginOnly(bottom: 10),

        // test field
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              hintText: hintText,
              hintStyle: getTextStyle(fontFamily: 'bricolage', fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.secondary),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              suffixIcon: suffix,
            ),
          ),
        ),
      ],
    ).marginOnly(bottom: marginBottom!);
  }
}
