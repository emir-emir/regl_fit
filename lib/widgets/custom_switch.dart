import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constant/gen/color_gen.dart';

class CustomSwitch extends StatefulWidget {
  final Color? activeColor;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? inactiveThumbColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  CustomSwitch({
    this.activeColor,
    required this.value,
    required this.onChanged,
    this.inactiveThumbColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    super.key,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _isSwitched = false;
  @override
  void initState() {
    super.initState();
    _isSwitched = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: widget.activeColor ?? ColorGen.customColorBlue2,
      value: _isSwitched,
      inactiveThumbColor: widget.inactiveThumbColor,
      activeTrackColor: widget.activeTrackColor,
      inactiveTrackColor: widget.inactiveTrackColor,
      materialTapTargetSize: widget.materialTapTargetSize,
      dragStartBehavior: widget.dragStartBehavior,
      mouseCursor: widget.mouseCursor,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
    );
  }
}
