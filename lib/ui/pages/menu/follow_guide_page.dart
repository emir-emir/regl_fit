import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/widgets/custom_Icon.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/gen/color_gen.dart';

import '../menu/birth_control.dart';
import '../menu/health_record.dart';
import '../menu/remind_page.dart';
import '../menu/setting_page.dart';
import '../menu/support.dart';

class FollowGuidePage extends StatefulWidget {
  const FollowGuidePage({super.key});

  @override
  State<FollowGuidePage> createState() => _FollowGuidePageState();
}

class _FollowGuidePageState extends State<FollowGuidePage> {
  bool isThreeRow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Ansiklopedi",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            titleRow(title: "Kanama"),
            heightSpace,
            buildRow(title: "Adet", onTap: () {}),
            buildRow(title: "Lekelenme", onTap: () {}),
            titleRow(title: "Sağlık"),
            buildRow(title: "Duygular", onTap: () {}),
            buildRow(title: "PMS", onTap: () {}),
            buildRow(title: "Uyku", onTap: () {}),
            buildRow(title: "Enerji", onTap: () {}),
            buildRow(title: "Sosyal hayat", onTap: () {}),
            titleRow(title: "Vücut"),
            buildRow(title: "Ağrı", onTap: () {}),
            buildRow(title: "Saç", onTap: () {}),
            buildRow(title: "Akıntı", onTap: () {}),
            titleRow(title: "Aktiviteler"),
            buildRow(title: "Cinsel hayat", onTap: () {}),
            titleRow(title: "Medikal"),
            buildRow(title: "Testler", onTap: () {}),
          ],
        ),
      ),
    );
  }

  CustomText titleRow({String? title}) {
    return CustomText(
      text: title!,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  Widget buildRow({required String title, required Function() onTap, IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorGen.customColorWhite,
            ),
            child: Row(
              children: [
                CustomText(text: title, fontSize: 18),
                Spacer(),
                CustomIcon(
                  icon: icon ?? Icons.arrow_forward_ios,
                  iconColor: ColorGen.customColorBlack,
                ),
              ],
            ),
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
}
