import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../widgets/custom_text.dart';

class AnalysisMenstrualFlowPage extends StatefulWidget {
  const AnalysisMenstrualFlowPage({super.key});

  @override
  State<AnalysisMenstrualFlowPage> createState() => _AnalysisMenstrualFlowPageState();
}

class _AnalysisMenstrualFlowPageState extends State<AnalysisMenstrualFlowPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Adet Akıntısı",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              Container(
                width: double.infinity,
                // height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorGen.customColorGrey.withOpacity(0.5),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomPaint(
                        painter: CirclePainter(),
                        size: Size(MediaQuery.of(context).size.width / 3, MediaQuery.of(context).size.width / 5),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Ortalama Adet Süresi", fontSize: 15),
                          Row(
                            children: [
                              Icon(Icons.remove, size: 30, color: Colors.black),
                              Text("gün", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 4.5;
    final paint = Paint()
      ..color = Color(0xffEBE7E4)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // 1. Yay
    final startAngle1 = -2 / 3.5 * math.pi;
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
    final sweepAngle4 = math.pi / 15;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle4,
      sweepAngle4,
      false,
      paint,
    );
    // final startAngle8 = 1 / 5 * math.pi; // yerini değiştiriyor
    // final sweepAngle8 = -6 / 6 * math.pi;
    // todo kırmızı alan
    final arcPaint = Paint()
      ..color = ColorGen.customColorRed // Farklı bir renk seç
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round // drawArc ların köşelerini oval yapıyor
      ..style = PaintingStyle.stroke;
    final startAngle5 = -9 / 15 * math.pi; // yerini değiştiriyor
    final sweepAngle5 = 7 / 15 * math.pi; // uzunluğu gösteriyor
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle5,
      sweepAngle5,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
