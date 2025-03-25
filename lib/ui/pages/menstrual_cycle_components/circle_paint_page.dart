import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reglfit/constant/gen/color_gen.dart';

class CirclePaintPage extends StatefulWidget {
  final List<double>? angles;
  final List<ui.Image>? images;

  const CirclePaintPage({super.key, this.angles, this.images});

  @override
  State<CirclePaintPage> createState() => _CirclePaintPageState();
}

class _CirclePaintPageState extends State<CirclePaintPage> {
  ui.Image? image1;

  @override
  void initState() {
    // TODO: implement initState
    loadImage();
  }

  Future<void> loadImage() async {
    final ByteData data = await rootBundle.load('assets/images/cloud2.png'); // Resminizin yolunu belirtin
    ui.decodeImageFromList(data.buffer.asUint8List(), (ui.Image img) {
      setState(() {
        image1 = img;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.r,
            height: MediaQuery.of(context).size.height * 0.5.r,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: image1 == null
                  ? CircularProgressIndicator()
                  : CustomPaint(
                      painter: CirclePainter(image: image1, angle: math.pi / 4),
                    ),
            ),
          ),
        ),
      );
}

class CirclePainter extends CustomPainter {
  // todo  Daire  çizgi çizmek için kullanılır
  final ui.Image? image;
  final double? angle; // Açıyı ekleyin
  CirclePainter({this.image, this.angle});

  @override
  Future<void> paint(Canvas canvas, Size size) async {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final imageSize = Size(40, 40);
    final paint = Paint()
      ..color = Color(0xffEBE7E4)
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round // drawArc ların köşelerini oval yapıyor
      ..style = PaintingStyle.stroke; //çizilen şeklin içerisinin doldurup doldurmayacağını ayarlar

    // todo 1
    final startAngle1 = -2 / 3.5 * math.pi; // Başlangıç açısı (-150 derece)
    final sweepAngle1 = 2 / 2 * math.pi; // Yayın açısı (120 derece)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle1,
      sweepAngle1,
      false,
      paint,
    );

//todo 2
    final startAngle2 = 1 / 6 * math.pi; // Başlangıç açısı (30 derece)
    final sweepAngle2 = 2 / 3 * math.pi; // Yayın açısı (120 derece)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle2,
      sweepAngle2,
      false,
      paint,
    );
//todo 3
    final startAngle3 = math.pi / 2; // Başlangıç açısı (-30 derece)
    final sweepAngle3 = math.pi / 2; // Yayın açısı (60 derece)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle3,
      sweepAngle3,
      false,
      paint,
    );

//todo 4
    final startAngle4 = math.pi / 1; //  yerini değiştiriyorBaşlangıç açısı (-30 derece)

    final sweepAngle4 = math.pi / 4; //uzunluğu gösteriyor
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle4,
      sweepAngle4,
      false,
      paint,
    );

// todo mavi alan
    final arcPaint = Paint()
      ..color = Color(0xff1E7B9c) // Farklı bir renk seç
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round // drawArc ların köşelerini oval yapıyor
      ..style = PaintingStyle.stroke;
    final startAngle5 = 1 / 4 * math.pi; // yerini değiştiriyor
    final sweepAngle5 = 2 / 6 * math.pi; // uzunluğu gösteriyor
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle5,
      sweepAngle5,
      false,
      arcPaint,
    );

    //todo mavi alan üzerindeki  BÜYÜK daire

    final startAngle6 = 1 / 4 * math.pi; // yerini değiştiriyor
    final sweepAngle6 = 2 / 6 * math.pi; // uzunluğu gösteriyor
    final circleBig = Offset(
      center.dx + (radius - 160) * cos(startAngle6 + sweepAngle6 / 3), //sağa sola gitmesini sağlar
      center.dy + (radius) * sin(startAngle6 + sweepAngle6 / 1.4), // aşağı yukarı gitmesini sağlar
    );
    final circleBigPaint = Paint()
      ..strokeWidth = 2
      ..color = Color(0xff86DAF2) // Daire rengi
      ..style = PaintingStyle.fill; // Dairenin içini doldurmadık, sadece kenarlarını çizdik

    canvas.drawCircle(circleBig, 12, circleBigPaint); // Dairenin çizimi

    //todo mavi alan üzerindeki  KÜÇÜK daire

    final startAngle7 = 1 / 4 * math.pi; // yerini değiştiriyor
    final sweepAngle7 = 2 / 6 * math.pi; // uzunluğu gösteriyor
    final circleSmall = Offset(
      center.dx + (radius - 160) * cos(startAngle7 + sweepAngle7 / 3), //sağa sola gitmesini sağlar
      center.dy + (radius) * sin(startAngle7 + sweepAngle7 / 1.1), // aşağı yukarı gitmesini sağlar
    );
    final circleSmallPaint = Paint()
      ..strokeWidth = 2
      ..color = Color(0xff1E7B9c) // Daire rengi
      ..style = PaintingStyle.fill; // Dairenin içini doldurmadık, sadece kenarlarını çizdik

    canvas.drawCircle(circleSmall, 5, circleSmallPaint); // Dairenin çizimi

    //todo Baştaki kırmızı  Daire
    final startAngle8 = 1 / 5 * math.pi; // yerini değiştiriyor
    final sweepAngle8 = -6 / 6 * math.pi; // uzunluğu gösteriyor
    final headCircleBig = Offset(
      center.dx + (radius - 200) * cos(startAngle8 + sweepAngle8 / 3.9), //sağa sola gitmesini sağlar
      center.dy + (radius) * sin(startAngle8 + sweepAngle8 / 1.6), // aşağı yukarı gitmesini sağlar
    );
    final HeadcircleBigPaint = Paint()
      ..color = ColorGen.customColorRed // Daire rengi
      ..style = PaintingStyle.fill; // Dairenin içini doldurmadık, sadece kenarlarını çizdik

    canvas.drawCircle(headCircleBig, 15, HeadcircleBigPaint); // Dairenin çizimi

    // todo bulut resimleri

    final offsets = [
      Offset(imageSize.width + 1, imageSize.height + 6),
      Offset(imageSize.width - 28, -imageSize.height + 130),
      Offset(imageSize.width - 42, -imageSize.height + 180),
    ];

    final angles = [math.pi / -4, -math.pi / 2.5, math.pi / -2.1];

    void drawRotatedImage(Canvas canvas, Offset center, Size imageSize, ui.Image image, double angle) {
      final imageOffset = Offset(center.dx - imageSize.width / 2, center.dy - imageSize.height / 2);

      canvas.save();
      canvas.translate(imageOffset.dx + imageSize.width / 2, imageOffset.dy + imageSize.height / 1);
      canvas.rotate(angle);
      canvas.translate(-imageSize.width / 1.5, -imageSize.height / 2.4);
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(0, 0, imageSize.width, imageSize.height),
        Paint(),
      );
      canvas.restore();
    }

    for (int i = 0; i < offsets.length; i++) {
      drawRotatedImage(canvas, offsets[i], imageSize, image!, angles[i]);
    }
    // 45 degrees
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
