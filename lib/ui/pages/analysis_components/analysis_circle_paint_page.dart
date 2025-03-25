import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../constant/constants.dart';
import '../../../widgets/custom_text.dart';

class AnalysisCirclePaintPage extends StatefulWidget {
  AnalysisCirclePaintPage({required this.color, this.isPoint, super.key});

  Color color;
  bool? isPoint = false;

  @override
  State<AnalysisCirclePaintPage> createState() => _AnalysisCirclePaintPageState();
}

class _AnalysisCirclePaintPageState extends State<AnalysisCirclePaintPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: CirclePainter(color: widget.color, isPoint: widget.isPoint),
          size: Size(MediaQuery.of(context).size.width / 2, MediaQuery.of(context).size.width / 2),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            heightSpace,
            Icon(Icons.remove, size: 30, color: Colors.black),
            Text("gün", style: TextStyle(fontSize: 18, color: Colors.black)),
            heightSpace45,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline, size: 20),
                widthSpace15,
                CustomText(text: "Daha fazla bilgi", fontSize: 15),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  Color color = Color(0xff197a8b);
  bool? isPoint = false;

  CirclePainter({required this.color, this.isPoint});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 3);
    final radius = size.width / 4.5;
    final paint = Paint()
      ..color = color // Color(0xff197a8b)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // 1. Yay
    final startAngle1 = -2 / 4 * math.pi;
    final sweepAngle1 = 2 / 2 * math.pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle1,
      sweepAngle1,
      false,
      paint,
    );

    // 2. Yay
    final startAngle2 = 1 / 6 * math.pi;
    final sweepAngle2 = 2 / 3 * math.pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle2,
      sweepAngle2,
      false,
      paint,
    );

    // 3. Yay
    final startAngle3 = math.pi / 2;
    final sweepAngle3 = math.pi / 2;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle3,
      sweepAngle3,
      false,
      paint,
    );

    // 4. Yay
    final startAngle4 = math.pi;
    final sweepAngle4 = math.pi / 4;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle4,
      sweepAngle4,
      false,
      paint,
    );

    if (isPoint == true) {
      //todo mavi alan üzerindeki  KÜÇÜK daire

      final startAngle7 = math.pi; // yerini değiştiriyor
      // final sweepAngle7 = 2 / 6 * math.pi; // uzunluğu gösteriyor
      final circleSmall = Offset(
        center.dx + radius * math.cos(startAngle7) + radius - 28, // sağ sola hareket ettiriyor
        center.dy + radius * math.sin(startAngle7) - radius + 12, // aşağı yıkarı
      );
      final circleSmall2 = Offset(
        center.dx + radius * math.cos(startAngle7) + radius - 22, // sağ sola hareket ettiriyor
        center.dy + radius * math.sin(startAngle7) - radius + 7, // aşağı yıkarı
      );
      final circleSmall3 = Offset(
        center.dx + radius * math.cos(startAngle7) + radius - 16, // sağ sola hareket ettiriyor
        center.dy + radius * math.sin(startAngle7) - radius + 4, // aşağı yıkarı
      );
      final circleSmallPaint = Paint()
        ..strokeWidth = 2
        ..color = Color(0xff1E7B9c) // Daire rengi
        ..style = PaintingStyle.fill; // Dairenin içini doldurmadık, sadece kenarlarını çizdik

      canvas.drawCircle(circleSmall, 4, circleSmallPaint); // Dairenin çizimi
      canvas.drawCircle(circleSmall2, 3, circleSmallPaint); // Dairenin çizimi
      canvas.drawCircle(circleSmall3, 2, circleSmallPaint); // Dairenin çizimi
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
