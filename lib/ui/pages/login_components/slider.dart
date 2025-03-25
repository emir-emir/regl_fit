import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/constant/gen/color_gen.dart';
import 'package:reglfit/ui/pages/home_page.dart';
import 'package:reglfit/widgets/custom_image.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_text_button.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      "assets/images/araba1.jpg",
      "assets/images/araba2.jpg",
      "assets/images/araba3.jpg",
    ];
    return Scaffold(
      body: ListView(children: [
        Stack(children: [
          ClipPath(
            clipper: BottomOvalClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.73.r,
              decoration: const BoxDecoration(color: Colors.red),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CustomImageAsset(
                    ImageUrl: imageUrls[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: imageUrls.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 100),
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Colors.black,
                    size: 8.0,
                    activeSize: 10.0,
                  ),
                ),
                // control: const SwiperControl(), // yanlardaki ok işaretlerini gösteriyor
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: CustomText(
                text: "Bir 7 gün ücretsiz deneme ile Clue\nPlus'ı keşfet",
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 580),
            child: Align(
              alignment: Alignment.bottomLeft, // Ortaya hizalama
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 170,
                      height: 270,
                      decoration: BoxDecoration(
                        color: ColorGen.customColorPurpleLight,
                        border: Border.all(
                          color: ColorGen.customColorPurple,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: CustomText(
                              text: "7 gün ücretsiz\n deneme",
                              color: ColorGen.customColorWhite,
                              textAlign: TextAlign.center,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            height: 170 / 3,
                            width: double.infinity,
                            color: ColorGen.customColorPurple,
                          ),
                          heightSpace10,
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(text: "YILLIK PLAN\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple)),
                                TextSpan(text: "₺31,67\n", style: FontSizeGen.titleLarge(context)?.copyWith(fontWeight: FontWeight.bold, color: ColorGen.customColorPurple)),
                                TextSpan(text: "aylık\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple)),
                                TextSpan(text: "Yılda bir kez\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple)),
                                TextSpan(text: "fatura edilir\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple)),
                                TextSpan(text: "12 ay için\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple)),
                                TextSpan(text: "₺379,99\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    widthSpace5,
                    containerPlan(context, title1: "AYLIK PLAN\n", title2: "₺52,99\n", title3: "Her ay fatura\n", title4: "edebilir"),
                    widthSpace5,
                    containerPlan(context, title1: "3 AYLIK PLAN\n", title2: "₺52,99\n", title3: "Her ay fatura\n", title4: "edebilir"),
                    widthSpace5,
                    containerPlan(context, title1: "6 AYLIK PLAN\n", title2: "₺52,99\n", title3: "Her ay fatura\n", title4: "edebilir"),
                  ],
                ),
              ),
            ),
          ),
        ]),
        heightSpace10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomElevatedButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            text: "ÜCRETSİZ DENEMEYİ BAŞLAT",
            backgroundColor: ColorGen.customColorBlue2,
            textColor: ColorGen.customColorWhite,
          ),
        ),
        heightSpace10,
        CustomText(
          text: "Ücretsiz deneme hafta içindir.Daha sonra ücret alınacaktır.\nTüm abonelikler otomatik olarak yenilenir.istediğin zaman\niptal et.",
          softWrap: true,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        CustomTextButton(
          text: "Hizmet Koşulları",
          onTap: () {},
          textColor: ColorGen.customColorBlue2,
        )
      ]),
    );
  }

  Container containerPlan(BuildContext context, {String? title1, String? title2, String? title3, String? title4}) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      width: 165,
      height: 160,
      decoration: BoxDecoration(
        color: ColorGen.customColorWhite,
        border: Border.all(
          color: ColorGen.customColorBlack,
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(text: title1, style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorBlack)),
            TextSpan(text: title2, style: FontSizeGen.titleLarge(context)?.copyWith(fontWeight: FontWeight.bold, color: ColorGen.customColorBlack)),
            TextSpan(text: title3, style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorBlack)),
            TextSpan(text: title4, style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorBlack)),
          ],
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
