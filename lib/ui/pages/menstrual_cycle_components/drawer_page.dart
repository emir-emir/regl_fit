import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/widgets/custom_Icon.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_Ios_calendar.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/dual_customIos_calendar.dart';
import '../login_components/security_page.dart';
import '../menu/birth_control.dart';
import '../menu/follow_guide_page.dart';
import '../menu/health_record.dart';
import '../menu/legal_page.dart';
import '../menu/remind_page.dart';
import '../menu/setting_page.dart';
import '../menu/support.dart';
import 'mode_page.dart';

class DraverPage extends StatefulWidget {
  const DraverPage({super.key});

  @override
  State<DraverPage> createState() => _DraverPageState();
}

class _DraverPageState extends State<DraverPage> {
  bool isThreeRow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Daha Fazla Menü",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            userName(context),
            heightSpace10,
            Divider(thickness: 1, color: Colors.grey.shade400),
            heightSpace10,
            plusBuyButton,
            heightSpace10,
            menstrualFollowButton,
            heightSpace10,
            healthProfile(
              trioRow: false,
              title: "Sağlık Profili",
              subTitle1: "Sağlık Kaydım",
              subTitle2: "Doğum Kontrolü",
              onTap1: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HealthRecord()));
              },
              onTap2: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BirthControlPage()));
              },
              onTap3: () {},
            ),
            healthProfile(
              trioRow: true,
              title: "Uygulama Tercihleri",
              subTitle1: "Hatırlatmalar",
              subTitle2: "Ayarlar",
              subTitle3: "RegFit Connect",
              onTap1: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RemindPage()));
              },
              onTap2: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettiongPage()));
              },
              onTap3: () {},
            ),
            healthProfile(
              trioRow: true,
              title: "Kaynaklar",
              subTitle1: "Takip rehberi",
              subTitle2: "Destek",
              subTitle3: "Yasal",
              onTap1: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FollowGuidePage()));
              },
              onTap2: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SupportPage()));
              },
              onTap3: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LegaPage()));
              },
            ),
            healthProfile(
              trioRow: true,
              title: "Daha Fazla ReglFit",
              subTitle1: "ReglFit uygulama simgeleri",
              subTitle2: "ReglFit puan ver",
              subTitle3: "ReglFit Paylaş",
              icon: Icons.screen_share,
              onTap1: () {},
              onTap2: () {},
              onTap3: () {},
            ),
          ],
        ),
      ),
    );
  }

  Column healthProfile({
    String? title,
    String? subTitle1,
    String? subTitle2,
    String? subTitle3,
    IconData? icon,
    required Function() onTap1,
    required Function() onTap2,
    required Function() onTap3,
    required bool trioRow,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title!,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        heightSpace,
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorGen.customColorWhite,
          ),
          child: Column(
            children: [
              trioRow == false
                  ? Column(
                      children: [
                        buildRow(title: subTitle1!, onTap: onTap1),
                        buildRow(title: subTitle2!, onTap: onTap2),
                      ],
                    )
                  : Column(
                      children: [
                        buildRow(title: subTitle1!, onTap: onTap1),
                        buildRow(title: subTitle2!, onTap: onTap2, icon: icon),
                        buildRow(title: subTitle3!, onTap: onTap3, icon: icon),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildRow({required String title, required Function() onTap, IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(text: title, fontSize: 18),
              Spacer(),
              CustomIcon(
                icon: icon ?? Icons.arrow_forward_ios,
                iconColor: ColorGen.customColorBlack,
              ),
            ],
          ),
          Divider(thickness: 1, color: Colors.grey.shade400)
        ],
      ),
    );
  }

  Padding titleTextFormField({String? title, String? message}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          maxLength: 150,
          decoration: InputDecoration(
            labelText: title,
            // 'Başlık',
            labelStyle: const TextStyle(color: ColorGen.customColorBlack),
            fillColor: Colors.white,
            filled: true,
            hintText: message,
            // "ReglFit",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorGen.customColorBlack, width: 2.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorGen.customColorBlack, width: 2.0),
            ),
          )),
      // Normal yazı rengi
    );
  }

  GestureDetector get menstrualFollowButton {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: ColorGen.customColorBlue2,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              const CustomText(
                text: "Mod ",
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: ColorGen.customColorWhite,
              ),
              Spacer(),
              const CustomText(
                text: "RegFit Adet Takibi ",
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: ColorGen.customColorWhite,
              ),
              CustomIcon(
                icon: Icons.arrow_forward_ios,
                iconColor: ColorGen.customColorWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector get plusBuyButton {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: ColorGen.customColorPurple3,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              CustomIcon(
                icon: Icons.restart_alt,
                iconColor: ColorGen.customColorWhite,
              ),
              const CustomText(
                text: "Regl Fit  Plus Al",
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: ColorGen.customColorWhite,
              ),
              Spacer(),
              CustomIcon(
                icon: Icons.arrow_forward_ios,
                iconColor: ColorGen.customColorWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row userName(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(text: "Kullanıcı Adı\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
                  TextSpan(text: "Kullanıcı e-posta", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
                ],
              ),
            )
          ],
        ),
        Spacer(),
        CustomIcon(
          icon: Icons.arrow_forward_ios,
          iconColor: ColorGen.customColorBlack,
        ),
      ],
    );
  }
}
