import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colors.dart';

TextStyle getTextStyle({
  required String fontFamily,
  double fontSize = 14.0,
  FontWeight fontWeight = FontWeight.w400,
  TextAlign textAlign = TextAlign.center,
  Color color = AppColors.secondary,
  List<Shadow>? shadows,
  bool isUnderLine = false,

}) {
  TextStyle baseStyle;

  switch (fontFamily.toLowerCase()) {
    case 'bricolage':
      baseStyle = GoogleFonts.bricolageGrotesque();
      break;
    case 'montserrat':
      baseStyle = GoogleFonts.montserrat();
      break;
    default:
      baseStyle = GoogleFonts.poppins(); // fallback
  }

  return baseStyle.copyWith(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
    shadows: shadows,
    decoration: isUnderLine ? TextDecoration.underline : TextDecoration.none
  );
}
