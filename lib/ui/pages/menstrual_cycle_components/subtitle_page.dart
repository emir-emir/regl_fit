import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../widgets/custom_text.dart';

class SubTitlePage extends StatelessWidget {
  const SubTitlePage({super.key});

  @override
  Widget build(BuildContext context) {
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
}
