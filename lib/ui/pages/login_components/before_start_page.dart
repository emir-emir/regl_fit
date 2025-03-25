import 'package:flutter/material.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/ui/pages/login_components/forgot_password.dart';
import 'package:reglfit/ui/pages/login_components/term_service_page.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text_button.dart';

class BeforeStartPage extends StatefulWidget {
  const BeforeStartPage({super.key});

  @override
  State<BeforeStartPage> createState() => _BeforeStartPageState();
}

class _BeforeStartPageState extends State<BeforeStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          reglFitLogo(context),
          textDescription(context),
          heightSpace200,
          continueButton,
        ],
      ),
    );
  }

  CustomElevatedButton get continueButton {
    return CustomElevatedButton(
      text: "Anladım",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TermServicePage()));
      },
      backgroundColor: ColorGen.customColorBlue5,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
    );
  }

  Widget textDescription(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: "\nBaşlamadan önce",
                    style: FontSizeGen.headlineSmall(context)?.copyWith(
                      color: ColorGen.customColorBlack,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(text: "\nLütfen ebeveyninden veya haminden ReglFit\n hesabını oluşturmalarını iste\n", style: FontSizeGen.titleMedium(context)?.copyWith(fontWeight: FontWeight.bold, color: ColorGen.customColorBlack)),
              WidgetSpan(alignment: PlaceholderAlignment.middle, child: Text("• ", style: FontSizeGen.headlineMedium(context)?.copyWith(fontWeight: FontWeight.bold, color: ColorGen.customColorBlack))),
              TextSpan(text: "Regl Fit uygulamasını kullanabilmen için onların izni\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
              WidgetSpan(alignment: PlaceholderAlignment.middle, child: Text("• ", style: FontSizeGen.headlineMedium(context)?.copyWith(fontWeight: FontWeight.bold, color: ColorGen.customColorBlack))),
              TextSpan(text: "Gizlilik ayarlarını kurman için onlardan yardım", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
            ],
          ),
        ),
      ],
    );
  }

  Align reglFitLogo(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipOval(
        child: CustomImageAsset(
          alignment: Alignment.center,
          ImageUrl: "assets/icons/reglfit.png",
          height: context.height / 6,
          width: context.width / 2,
        ),
      ),
    );
  }
}
