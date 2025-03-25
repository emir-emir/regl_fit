import 'package:flutter/material.dart';
import 'package:reglfit/constant/gen/color_gen.dart';

class FourPoint extends StatelessWidget {
  const FourPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 213,
      left: 140,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: CustomPaint(
          foregroundPainter: ThreeDotsPainter(),
        ),
      ),
    );
  }
}

class ThreeDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()..color = ColorGen.customColorRed;
    final Paint paint2 = Paint()..color = ColorGen.customColorOrange;
    final Paint paint3 = Paint()..color = ColorGen.customColorBlue1;
    final Paint paint4 = Paint()..color = ColorGen.customColorGreen;
    final double radius = 5;

    // Noktalar
    canvas.drawCircle(Offset(96,-7), radius, paint1);
    canvas.drawCircle(Offset(86,4), radius, paint2);
    canvas.drawCircle(Offset(76,15), radius, paint3);
    canvas.drawCircle(Offset(65, 26), radius, paint4);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
