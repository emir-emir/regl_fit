import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../widgets/custom_calendar.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_button.dart';
import 'average_cycle.dart';

class LastMenstruationPage extends StatefulWidget {
  const LastMenstruationPage({super.key});

  @override
  State<LastMenstruationPage> createState() => _LastMenstruationPageState();
}

class _LastMenstruationPageState extends State<LastMenstruationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          bloodImage(context),
          textDescription(title: "Son Adet dönemin ne\nzaman başladı ?", fontWeight: FontWeight.bold, fontSize: 25),
          heightSpace,
          textDescription(title: "Ardından sonraki adetini tahmin edebiliriz", fontWeight: FontWeight.normal, fontSize: 15),
          heightSpace,
          CustomCalendarPage(),
          heightSpace155,
          RowButtons,
        ],
      ),
    );
  }

  Align bloodImage(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipOval(
        child: CustomImageAsset(
          alignment: Alignment.center,
          ImageUrl: "assets/icons/kan1.png",
          fit: BoxFit.fill,
          // height: 90,
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
      // ,,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AverageCyclePage()));
              },
              textColor: ColorGen.customColorBlue2,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              text: "Sonraki",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AverageCyclePage()));
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
