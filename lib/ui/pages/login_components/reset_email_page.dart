import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/extensions/context_extension.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';

class ResetEmailPage extends StatefulWidget {
  const ResetEmailPage({super.key});

  @override
  State<ResetEmailPage> createState() => _ResetEmailPageState();
}

class _ResetEmailPageState extends State<ResetEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          reglFitLogo,
          textDescription,
          heightSpace110,
          continueButton,
        ],
      ),
    );
  }

  CustomElevatedButton get continueButton {
    return CustomElevatedButton(
      text: "E-postayı tekrar gönder",
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ResetEmailPage()));
      },
      backgroundColor: ColorGen.customColorBlue5,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
    );
  }

  Align get reglFitLogo {
    return Align(
      alignment: Alignment.center,
      child: ClipOval(
        child: CustomImageAsset(
          alignment: Alignment.center,
          ImageUrl: "assets/images/araba1.jpg",
          height: context.height / 4,
          width: context.width / 2,
        ),
      ),
    );
  }

  RichText get textDescription {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "\nŞifreni sıfırlamak için gelen\nkutuna bak\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(
              text: "\nEğer... kayıtlıysa,kısa süre\n sonra talimatlar içeren bir eposta alacaksın.Bulamazsan\neğer sana yardım edeceğiz\nistenmeyen posta klasörünü kontrol et yada tekrar\ngönder.",
              style: FontSizeGen.titleSmall(context)?.copyWith(
                fontWeight: FontWeight.normal,
                color: ColorGen.customColorBlack,
              )),
        ],
      ),
    );
  }
}
