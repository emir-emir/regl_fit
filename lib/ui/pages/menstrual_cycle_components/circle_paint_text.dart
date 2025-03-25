import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';

class CirclePaintText extends StatelessWidget {
  const CirclePaintText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280.r,
      left: 100.r,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(text: "Bugün ", style: FontSizeGen.titleSmall(context)),
            TextSpan(text: "Şubat 10\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.w300)),
            TextSpan(text: "Sonraki Adetin Mart\n", style: FontSizeGen.titleLarge(context)?.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(text: "02 günü başlayacak\n", style: FontSizeGen.titleLarge(context)?.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(text: "Foliküler evre hakkında\n", style: FontSizeGen.titleSmall(context)?.copyWith(color: ColorGen.customColorBlue2)),
            WidgetSpan(child: Icon(FontAwesomeIcons.lock, color: ColorGen.customColorBlue2,size: 15,))
          ],
        ),
      ),
    );
  }
}
