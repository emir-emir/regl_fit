import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/gen/color_gen.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Widget title;
  final Color? titleColor;
  final Widget? subtitle;
  final Color? checkColor;
  final Color? activeColor;
  final ListTileControlAffinity? listTileControlAffinity;
  CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.activeColor = ColorGen.customColorBlue2,
    this.checkColor = ColorGen.customColorWhite,
    this.titleColor,
    this.listTileControlAffinity,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: title,
      subtitle: subtitle,
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      checkColor: checkColor,
      tileColor: titleColor,
      controlAffinity: listTileControlAffinity ?? ListTileControlAffinity.leading,
      tristate: true,
    );
  }
}
