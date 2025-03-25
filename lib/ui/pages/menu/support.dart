import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/ui/pages/login_components/forgot_password.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_Icon.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text_button.dart';
import '../contents_components/content_home_page.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  bool _isSwitchedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destek"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heightSpace20,
              otherReminder(
                subTitle1: "Hesap Soruları",
                onTap1: () {},
              ),
              heightSpace,
              otherReminder(
                subTitle1: "Teknik soruları",
                onTap1: () {},
              ),
              heightSpace,
              otherReminder(
                subTitle1: "Regfit Adet Takibi",
                onTap1: () {},
              ),
              heightSpace,
              otherReminder(
                subTitle1: "RegFit Plus",
                onTap1: () {},
              ),
              heightSpace,
              otherReminder(
                subTitle1: "RegFit hamilelik",
                onTap1: () {},
              ),
              heightSpace,
              otherReminder(
                subTitle1: "Geri bildirim ve öneriler",
                onTap1: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column otherReminder({
    String? subTitle1,
    IconData? icon,
    required Function() onTap1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorGen.customColorWhite,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  buildRow(
                    title: subTitle1!,
                    onTap: onTap1,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(thickness: 1, color: Colors.grey.shade400),
      ],
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
              widthSpace,
              CustomIcon(
                icon: Icons.arrow_forward_ios,
                iconColor: ColorGen.customColorBlack,
              )
            ],
          ),
        ],
      ),
    );
  }
}
