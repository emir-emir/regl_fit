import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/widgets/custom_calendar.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_Icon.dart';
import '../../../widgets/custom_image.dart';
import 'birthday.dart';

class ToMeetPage extends StatefulWidget {
  const ToMeetPage({super.key});

  @override
  State<ToMeetPage> createState() => _ToMeetPageState();
}

class _ToMeetPageState extends State<ToMeetPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          imageTop(context),
          textDescription(context),
          Column(
            children: [
              dualContainer(
                  leftIcon: Icons.loop,
                  rightIcon: Icons.chevron_right_outlined,
                  title: 'Döngümü Takip Et',
                  subTitle: "Adet,hamile kalma,hamilelik veya\nperimenopoz deneyimlerini takip et.",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BirthdayPage()));
                  }),
              heightSpace30,
              dualContainer(leftIcon: Icons.loop, rightIcon: Icons.chevron_right_outlined, title: 'Döngümü Takip Et', subTitle: "Adet,hamile kalma,hamilelik veya\nperimenopoz deneyimlerini takip et."),
            ],
          ),
        ]),
      ),
    );
  }

  Widget dualContainer({IconData? leftIcon, IconData? rightIcon, String? title, String? subTitle, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            color: ColorGen.customColorGrey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          children: [
                            CustomIcon(
                              icon: leftIcon!,
                              iconColor: ColorGen.customColorBlue2,
                              iconSize: 25,
                            ),
                            widthSpace,
                            CustomText(
                              text: title!,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: ColorGen.customColorBlue2,
                            ),
                          ],
                        ),
                      ),
                      CustomText(
                        text: subTitle!,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.r,
                        color: ColorGen.customColorBlue2,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                Expanded(
                  child: CustomIcon(
                    icon: rightIcon!, //Icons.chevron_right_outlined,
                    iconColor: ColorGen.customColorBlue2,
                    iconSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align textDescription(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(text: "Tanıştığımıza sevindik\n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
            TextSpan(text: "Başlamak için yolculuğunu seç\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
          ],
        ),
      ),
    );
  }

  ClipPath imageTop(BuildContext context) {
    return ClipPath(
      clipper: BottomOvalClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4.r,
        decoration: const BoxDecoration(color: Colors.red),
        child: CustomImageAsset(
          ImageUrl: "assets/images/araba1.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BottomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 150);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
