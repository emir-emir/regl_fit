import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reglfit/widgets/custom_Icon.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../widgets/custom_Ios_calendar.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_button.dart';
import 'menstrual_reminder.dart';

class AverageCyclePage extends StatefulWidget {
  const AverageCyclePage({super.key});

  @override
  State<AverageCyclePage> createState() => _AverageCyclePageState();
}

class _AverageCyclePageState extends State<AverageCyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          reglFitLogo(context),
          textDescription(title: "Ortalama döngün ne kadar\nsürer ?", fontWeight: FontWeight.bold, fontSize: 25),
          heightSpace,
          textDescription(title: "Küçük bir ipucu döngüler genellikle 24 ile 38 gün sürer", fontWeight: FontWeight.normal, fontSize: 15),
          heightSpace200,
          CustomIosCalendarPage(
            title: "Gün",
          ),
          heightSpace45,
          RowButtons,
        ],
      ),
    );
  }

  Align reglFitLogo(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipOval(
        child: Container(
          height: 50,
          width: 50,
          color: ColorGen.customColorGreen.withOpacity(0.3),
          child: CustomIcon(
            icon: Icons.calendar_month,
            iconSize: 30,
            iconColor: ColorGen.customColorGreen,
          ),
        ),
      ),
    );
  }

  CustomText textDescription({
    String? title,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return CustomText(
      textAlign: TextAlign.center,
      text: title!,
      color: ColorGen.customColorBlack,
      fontWeight: fontWeight,
      //
      fontSize: fontSize, // 25,
    );
  }

  Widget get RowButtons {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextButton(
              text: 'Emin değilim',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenstrualReminderPage()));
              },
              textColor: ColorGen.customColorBlue2,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              text: "Sonraki",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenstrualReminderPage()));
              },
              backgroundColor: ColorGen.customColorBlue2,
              textColor: ColorGen.customColorWhite,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
