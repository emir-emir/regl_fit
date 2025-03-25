import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUnderlinedText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final TextAlign? textAlign;

  const CustomUnderlinedText({Key? key, required this.text, required this.color, required this.fontSize, required this.fontFamily, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: Colors.transparent,
          shadows: [Shadow(offset: const Offset(0, -1), color: color)],
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1.5.w,
          decorationColor: color,
          fontFamily: fontFamily,
          fontSize: fontSize.sp,
          fontStyle: FontStyle.normal,
        ),
        textAlign: textAlign ?? TextAlign.center);
  }
}
