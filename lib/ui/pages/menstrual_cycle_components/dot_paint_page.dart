import 'dart:math';
import 'package:flutter/material.dart';


class DotPaintPage extends StatelessWidget {
  const DotPaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: CustomPaint(
          foregroundPainter: DottedCirclePainter(120),
        ),
      ),
    );
  }
}

class DottedCirclePainter extends CustomPainter {

  DottedCirclePainter(this.radius);
  final double radius;
  final List<int> skipPoints = [11,16,17]; // Çizilmemesi istenen noktaların indislerini buraya ekleyin

  @override //10
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Paint paint = Paint()..color = Color(0xffEBE7E4);
    final double filledCircleRadius = 3; // noktaların genişliğini ayarlar
    final int numberOfDots =28 ; // nokta adetini ayarlar
    final double radiantStep = 2 * pi / numberOfDots;

    for (int i = 0; i < numberOfDots; i++) {
      if (!skipPoints.contains(i)) { // Eğer bu nokta atlanmamalı ise çiz
        if (i == 15) { // index 1 olan nokta için kırmızı rengi ata
          paint.color = Colors.red;
        } else {
          paint.color = Color(0xffEBE7E4);
        }
        canvas.drawCircle(
          Offset(centerX + sin(i * radiantStep) * radius, centerY + cos(i * radiantStep) * radius),
          filledCircleRadius,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}





