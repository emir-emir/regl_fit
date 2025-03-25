import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({
    required this.icon,
    this.iconSize = 24,
    this.iconColor,
    this.semanticLabel,
    this.textDirection,
    this.shadows,
    super.key,
  });

  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: iconSize,
      color: iconColor,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      shadows: shadows,
    );
  }
}
