import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.text,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.width = 200,
    this.height = 15,
    this.shape,
    this.yaziIcPadding,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final double height;
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? yaziIcPadding;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: yaziIcPadding,
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        fixedSize: Size(width, height),
        shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: CustomText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
