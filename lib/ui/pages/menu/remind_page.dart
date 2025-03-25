import 'package:flutter/material.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_Icon.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text_button.dart';
import '../login_components/slider.dart';
import 'birth_control_add.dart';

class RemindPage extends StatefulWidget {
  const RemindPage({super.key});

  @override
  State<RemindPage> createState() => _RemindPageState();
}

class _RemindPageState extends State<RemindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hatırlatmalar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heightSpace20,
              remindProfil(
                title: "Döngü hatırlatmaları",
                subTitle1: "Adetin yakında başlıyor",
                subTitle2: "Adetin başlayacağı tarih",
                subTitle3: "Adet gecikti",
                subTitle4: "Doğurganlık dönemi yakın",
                onTap1: () {},
                onTap2: () {},
                onTap3: () {},
              ),
              heightSpace20,
              otherReminder(
                title: "Diğer  hatırlatmaları",
                subTitle1: "Takip Hatırlatmaları",
                onTap1: () {},
              ),
              remindControlAddButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow({
    required String title,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(text: title, fontSize: 18),
              Spacer(),
              CustomText(text: "Kapalı", fontSize: 18),
              widthSpace,
              CustomIcon(
                icon: Icons.arrow_forward_ios,
                iconColor: ColorGen.customColorBlack,
              ),
            ],
          ),
          Divider(thickness: 1, color: Colors.grey.shade400)
        ],
      ),
    );
  }

  Column otherReminder({
    String? title,
    String? subTitle1,
    IconData? icon,
    required Function() onTap1,
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
              Column(
                children: [
                  buildRow(title: subTitle1!, onTap: onTap1),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  CustomElevatedButton get remindControlAddButton {
    return CustomElevatedButton(
      text: "Hatırlatma oluştur",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BirthControlAddPage()));
      },
      backgroundColor: ColorGen.customColorBlue2,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  Column remindProfil({
    String? title,
    String? subTitle1,
    String? subTitle2,
    String? subTitle3,
    String? subTitle4,
    IconData? icon,
    required Function() onTap1,
    required Function() onTap2,
    required Function() onTap3,
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
              Column(
                children: [
                  buildRow(title: subTitle1!, onTap: onTap1),
                  buildRow(
                    title: subTitle2!,
                    onTap: onTap2,
                  ),
                  buildRow(
                    title: subTitle3!,
                    onTap: onTap3,
                  ),
                  buildRow(
                    title: subTitle4!,
                    onTap: onTap3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
