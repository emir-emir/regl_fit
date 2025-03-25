import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reglfit/extensions/context_extension.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_Icon.dart';
import '../../../widgets/custom_text.dart';
import 'birthday.dart';
import '../../../widgets/custom_calendar.dart';
import 'last_menstruation.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textDescription1,
            textDescription2,
            container1(context),
            heightSpace,
            container2(context),
            heightSpace,
            container3(),
            heightSpace,
            container4(),
          ],
        ),
      ),
    );
  }

  CustomText get textDescription2 {
    return const CustomText(
      text: "Şimdi sana en iyi uyan modu seç.Modları\ndaha sonra istediğin zaman değiştirebilirsin.\n",
      color: ColorGen.customColorBlack,
      fontWeight: FontWeight.normal,
      fontSize: 15,
    );
  }

  CustomText get textDescription1 {
    return const CustomText(
      text: "Ne yapmak istersin",
      color: ColorGen.customColorBlack,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );
  }

  Widget container4() {
    return dualContainer(
        ContainerColor: ColorGen.customColorRed2,
        rightIcon: Icons.chevron_right_outlined,
        title: 'Perimenopozu takip et\n',
        subTitle: "Bedenim menopoza geçerken\ndeğişiklikleri anla",
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => BirthdayPage()));
        });
  }

  Widget container3() {
    return dualContainer(
        ContainerColor: ColorGen.customColorBlue1,
        rightIcon: Icons.chevron_right_outlined,
        title: 'Hamileliğimi takip et\n',
        subTitle: "Hamilelik ve lohusalık deneyimlerimi\ntakip et",
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => BirthdayPage()));
        });
  }

  Widget container2(BuildContext context) {
    return dualContainer(
        ContainerColor: ColorGen.customColorBlue6,
        rightIcon: Icons.chevron_right_outlined,
        title: 'Hamile kalmayı dene\n',
        subTitle: "Hamile kalmaya çalışmak için en\nuygun zaman hakkında tahmiler al",
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BirthdayPage()));
        });
  }

  Widget container1(BuildContext context) {
    return dualContainer(
        ContainerColor: ColorGen.customColorRed,
        rightIcon: Icons.chevron_right_outlined,
        title: 'Adetimi Takip Et\n',
        subTitle: "Tahminler almam için adet ve\n döngü deneyimlerimi kaydet",
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LastMenstruationPage()));
        });
  }

  Widget dualContainer({
    IconData? rightIcon,
    String? title,
    String? subTitle,
    Function()? onTap,
    Color? ContainerColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          width: context.width,
          decoration: BoxDecoration(
            color: ContainerColor ?? ColorGen.customColorGrey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Row(
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(text: title, style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorWhite, fontWeight: FontWeight.bold)),
                      TextSpan(text: subTitle, style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorWhite)),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: CustomIcon(
                    icon: rightIcon!, //Icons.chevron_right_outlined,
                    iconColor: ColorGen.customColorWhite,
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
}
