import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/constant/gen/color_gen.dart';
import 'package:reglfit/constant/gen/font_size_gen.dart';
import 'package:reglfit/ui/pages/menstrual_cycle_components/arrow_paint_page.dart';
import 'package:reglfit/ui/pages/menstrual_cycle_components/circle_paint_page.dart';
import 'package:reglfit/ui/pages/menstrual_cycle_components/dot_paint_page.dart';
import 'package:reglfit/ui/pages/menstrual_cycle_components/dropdown_page.dart';

import '../../../widgets/custom_text.dart';
import 'circle_paint_text.dart';
import 'drawer_page.dart';
import 'four_point.dart';
import 'mode_page.dart';

class MenstrualCycleHomePage extends StatefulWidget {
  MenstrualCycleHomePage({super.key});

  @override
  State<MenstrualCycleHomePage> createState() => _MenstrualCycleHomePageState();
}

class _MenstrualCycleHomePageState extends State<MenstrualCycleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarTitle,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(children: [
              CirclePaintPage(),
              bloodImage,
              // cloudIcon2,
              // cloudIcon3,
              ArrrowPainter,
              DotPaintPage(),
              FourPoint(),
              CirclePaintText(),
              circleDayText(context),
              GestureDetector(
                onTap: () {
                  MaterialPageRoute(builder: (context) => ModePage());
                },
                child: const DropDownButtonPage(),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Positioned circleDayText(BuildContext context) {
    return Positioned(
      top: 300.r,
      left: 305.r,
      child: Container(
        padding: EdgeInsets.only(top: 5),
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          color: ColorGen.customColorWhite,
          shape: BoxShape.circle, // Kenarlık rengi
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(text: "Gün\n", style: FontSizeGen.bodySmall(context)),
              TextSpan(text: "9", style: FontSizeGen.titleLarge(context)?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Positioned get bloodImage {
    return Positioned(
      top: 160,
      left: 90,
      child: Image.asset(
        "assets/icons/kan1.png",
        height: 50,
        width: 50,
      ),
    );
  }

  Positioned get cloudIcon2 {
    return Positioned(
      top: 245,
      left: 40,
      child: Transform.rotate(
        angle: pi * -60 / 180,
        child: Icon(
          FontAwesomeIcons.cloud,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }

  Positioned get cloudIcon3 {
    return Positioned(
      top: 280.r,
      left: 25.r,
      child: Transform.rotate(
        angle: pi * -60 / 150,
        child: Icon(
          FontAwesomeIcons.cloud,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }

  Positioned get ArrrowPainter {
    return Positioned(
      top: 350.r,
      left: -65.r,
      child: Transform.rotate(angle: pi * -60 / 150, child: ArrowPage()),
    );
  }

  Container get topContainerSubTitle {
    return Container(
      color: ColorGen.customColorBlue4,
      height: 120.h,
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.only(left: 20.r, right: 5.r, top: 15.r),
          child: Column(
            children: [
              RichText(
                text: const TextSpan(children: [
                  WidgetSpan(alignment: PlaceholderAlignment.middle, child: Icon(FontAwesomeIcons.square, color: Colors.black)),
                  TextSpan(text: 'Yeni ', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  WidgetSpan(alignment: PlaceholderAlignment.middle, child: Icon(FontAwesomeIcons.square, color: Colors.black)),
                  TextSpan(text: 'Tüm takip ettiğin deneyimlerini kolayca gör.artık  bir tek görüntü içinde.', style: TextStyle(color: Colors.white, fontSize: 16)),
                ]),
              ),
              // heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Bu ana başlığı gizle",
                    underLine: TextDecoration.underline,
                    decorationColor: Colors.white,
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                  widthSpace15,
                  ElevatedButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "Genel Bakış",
                      color: ColorGen.customColorBlue4,
                      fontSize: 15.sp,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  AppBar get appbarTitle {
    return AppBar(
      title: const CustomText(
        text: "Mevcut Adet Döngün",
        fontWeight: FontWeight.normal,
        fontSize: 25,
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DraverPage()));
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(FontAwesomeIcons.bars),
          ),
        ),
      ],
    );
  }
}
