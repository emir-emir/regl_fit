import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowPage extends StatelessWidget {
  const ArrowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: ArrowPainter(),
    );
  }
}

class ArrowPainter extends CustomPainter {

  @override
  Future<void> paint(Canvas canvas, Size size) async {
// todo ok işaretin yapımı
    Offset startPoint = Offset(110, 110);
    Offset endPoint = Offset(180, 100);
    var paintOk = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [  Color(0xFFB3AFAC), Color(0xFFB3AFAC)], // Siyahtan beyaza doğru bir geçiş
      ).createShader(Rect.fromPoints(startPoint, endPoint));
      // canvas.drawLine(startPoint, endPoint, paintOk); // bu düz çizgi
    // Oval çizgiyi çizin
    Path path = Path();
    path.moveTo(startPoint.dx -20, startPoint.dy -25);
    path.arcToPoint(
      Offset(startPoint.dx + 66.r, startPoint.dy -12.r),
      radius: Radius.circular(200),
    );
    canvas.drawPath(path, paintOk);

// Ok uçlarını çizin
    double arrowSize = 20;
    double theta = atan2(15, 40);// okun uçlarının yönünü belirtiyor


    // Okun birinci ucu
    Offset arrowPoint1 = Offset(
      endPoint.dx - arrowSize * cos(theta - pi / 6),
      endPoint.dy - arrowSize * sin(theta - pi / 6),
    );

    // Okun ikinci ucu
    Offset arrowPoint2 = Offset(
      endPoint.dx - arrowSize * cos(theta + pi / 6),
      endPoint.dy - arrowSize * sin(theta + pi / 6),
    );
    // Ok uçlarını çizin
    canvas.drawLine(endPoint, arrowPoint1, paintOk);
    canvas.drawLine(endPoint, arrowPoint2, paintOk);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
