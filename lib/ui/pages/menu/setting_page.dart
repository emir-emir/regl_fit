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

class SettiongPage extends StatefulWidget {
  const SettiongPage({super.key});

  @override
  State<SettiongPage> createState() => _SettiongPageState();
}

class _SettiongPageState extends State<SettiongPage> {
  bool _isSwitchedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
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
                subTitle1: "Gizlilik Ayarları",
                onTap1: () {},
                SwitchedView: false,
              ),
              Divider(thickness: 1, color: Colors.grey.shade400),
              heightSpace,
              otherReminder(
                subTitle1: "Verimimi indir",
                onTap1: () {},
                SwitchedView: false,
              ),
              Divider(thickness: 1, color: Colors.grey.shade400),
              heightSpace,
              otherReminder(
                subTitle1: "Doğurganlık dönemi göster",
                onTap1: () {},
                SwitchedView: true,
              ),
              Divider(thickness: 1, color: Colors.grey.shade400),
              heightSpace,
              CustomText(
                  text: "Dogurganlik dönemi, muhtemel ovülasyon günü dahil"
                      "ovülasyona dogru kalan gün sayisidir. Bu sadece bir"
                      "tahmindir ve dogum kontrolü için veya hamile kalmak için"
                      "kullanilmamalidir şu anda herhangi bir dogum kontrolü veya"
                      "hormon içeren ilaç aliyorsan, dogurganlik dönemini"
                      "kapatmani öneririz.")
            ],
          ),
        ),
      ),
    );
  }

  Column otherReminder({
    String? subTitle1,
    IconData? icon,
    bool? SwitchedView,
    required Function() onTap1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorGen.customColorWhite,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  buildRow(title: subTitle1!, onTap: onTap1, SwitchedView: SwitchedView),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildRow({
    required String title,
    required Function() onTap,
    bool? SwitchedView,
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
              SwitchedView == false
                  ? CustomIcon(
                      icon: Icons.arrow_forward_ios,
                      iconColor: ColorGen.customColorBlack,
                    )
                  : CustomSwitch(
                      value: _isSwitchedValue,
                      activeColor: ColorGen.customColorWhite,
                      activeTrackColor: ColorGen.customColorBlue2,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      autofocus: true,
                      onChanged: (bool value) {
                        setState(() {
                          _isSwitchedValue = value;
                        });
                      },
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
