import 'package:flutter/material.dart';
import 'package:reglfit/constant/gen/font_size_gen.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/ui/pages/login_components/login_email_page.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text_button.dart';

class InputTypesPage extends StatefulWidget {
  const InputTypesPage({super.key});

  @override
  State<InputTypesPage> createState() => _InputTypesPageState();
}

class _InputTypesPageState extends State<InputTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            reglFitLogo(context),
            textDescription(context),
            heightSpace200,
            Column(
              children: [
                loginWithEmailButton,
                loginWithGoogleButton,
                loginWithFacebookButton,
              ],
            ),
          ],
        ),
      ),
    );
  }

  CustomElevatedButton get loginWithFacebookButton {
    return CustomElevatedButton(
      text: "Facebook  ile giriş yap",
      onTap: () {},
      backgroundColor: ColorGen.customColorBlue7,
      textColor: ColorGen.customColorWhite,
      icon: Icons.facebook,
      iconColor: ColorGen.customColorWhite,
      fontSize: 20,
      width: 350,
    );
  }

  CustomElevatedButton get loginWithGoogleButton {
    return CustomElevatedButton(
      text: "Google ile giriş yap",
      onTap: () {},
      backgroundColor: ColorGen.customColorWhite,
      textColor: ColorGen.customColorBlack,
      ImageUrl: "assets/icons/google.png",
      Imagefit: BoxFit.fill,
      fontSize: 20,
      width: 350,
    );
  }

  CustomElevatedButton get loginWithEmailButton {
    return CustomElevatedButton(
      text: "E-Posta ile giriş yap",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginEmailPage()));
      },
      backgroundColor: ColorGen.customColorBlue5,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
    );
  }

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Regl Fit Ailesi Olarak\ngeri döndüğüne sevindik\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(text: "\nTekrar takip etmeye başlamak için hesabına\ngiriş yap\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
        ],
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
