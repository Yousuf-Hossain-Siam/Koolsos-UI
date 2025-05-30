import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import '../../../core/common/styles/global_text_style.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.title, this.backgroundColor});

  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        Shadow(
          color: Colors.black.withValues(alpha: 0.3),
          offset: Offset(2, 0),
          blurRadius: 8,
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 0,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              title,
              style: getTextStyle(
                color: const Color(0xFF262D2C),
                fontSize: 10,
                fontFamily: 'bricolage',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
