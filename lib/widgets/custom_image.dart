import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageAsset extends StatelessWidget {
  CustomImageAsset({
    required this.ImageUrl,
    this.onTap,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.color,
    super.key,
  });

  String ImageUrl;
  void Function()? onTap;
  BoxFit? fit;

  final double? width;
  final double? height;
  final AlignmentGeometry alignment;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        ImageUrl,
        fit: fit,
        width: width,
        height: height,
        alignment: alignment,
        color: color,
      ),
    );
  }
}
