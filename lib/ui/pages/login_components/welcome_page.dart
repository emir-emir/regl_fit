import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/ui/pages/login_components/to_meet_page.dart';
import 'package:reglfit/widgets/custom_image.dart';
import 'package:reglfit/widgets/custom_elevation_button.dart';
import 'package:reglfit/widgets/custom_text_button.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import 'input_types.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              heightSpace50,
              reglFitLogo(context),
              heightSpace20,
              Image(context),
              heightSpace20,
              textDescription(context),
              heightSpace60,
              accountTextButton(context),
              getStartElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }

  CustomElevatedButton getStartElevatedButton() {
    return CustomElevatedButton(
      text: "Get Started",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ToMeetPage()));
      },
      backgroundColor: ColorGen.customColorBlue5,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
      width: 300,
    );
  }

  CustomTextButton accountTextButton(BuildContext context) {
    return CustomTextButton(
      text: 'Bir hesabım var',
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => InputTypesPage()));
      },
      textColor: ColorGen.customColorBlue6,
      fontSize: 18,
    );
  }

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Döngünle uyumlu olarak yaşa\n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(text: "ilk adetinden sonuncuya kadar.\nRegl Fit olarak yanındayız\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
        ],
      ),
    );
  }

  Align Image(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageAsset(
        alignment: Alignment.center,
        ImageUrl: "assets/images/araba1.jpg",
        height: context.height / 3.6,
        width: context.width / 1.2,
      ),
    );
  }

  Align reglFitLogo(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageAsset(
        alignment: Alignment.center,
        ImageUrl: "assets/icons/reglfit.png",
        height: context.height / 6,
        width: context.width / 2,
      ),
    );
  }
}
