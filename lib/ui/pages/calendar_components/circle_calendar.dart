import 'package:flutter/material.dart';

import '../../../constant/gen/color_gen.dart';

class CircleCalendar extends StatelessWidget {
  CircleCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 42,
      left: 5,
      child: Stack(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: ColorGen.customColorBlue3,
              shape: BoxShape.circle,
              border: Border.all(color: ColorGen.customColorBlue2, width: 1),
            ),
          ),
          Positioned(
            top: 2,
            left: 4,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorGen.customColorBlue2,
                shape: BoxShape.circle,
                border: Border.all(color: ColorGen.customColorBlue2, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
