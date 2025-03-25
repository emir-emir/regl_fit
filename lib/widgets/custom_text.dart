import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/gen/color_gen.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDecoration? underLine;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final bool? softWrap;
  final FontWeight? fontWeight;
  final Color? decorationColor;

  const CustomText({
    super.key,
    this.color,
    required this.text,
    this.fontSize,
    this.fontFamily,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.underLine,
    this.height,
    this.softWrap,
    this.fontWeight,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        decoration: underLine,
        decorationColor: decorationColor,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1.5.w,
        color: color,
        fontSize: fontSize ?? 13.sp,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
      ),
    );
  }
}
