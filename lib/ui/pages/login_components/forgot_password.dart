import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/ui/pages/login_components/reset_email_page.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_elevation_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textDescription,
          epostaTextField,
          heightSpace30,
          // continueButton,
          continueButton,
        ],
      ),
    );
  }

  CustomElevatedButton get continueButton {
    return CustomElevatedButton(
      text: "Devam",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetEmailPage()));
      },
      backgroundColor: ColorGen.customColorBlue5,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
    );
  }

  CustomText get textDescription {
    return const CustomText(
      text: "Regl Fit hesabın için e-postanı gir\n",
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorGen.customColorBlack,
      textAlign: TextAlign.center,
    );
  }

  Padding get epostaTextField {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'E-posta',
          labelStyle: const TextStyle(
            color: ColorGen.customColorBlue2,
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorGen.customColorBlue2,
              width: 2.0,
            ),
          ),
        ),
        cursorColor: ColorGen.customColorBlue2,

        // Normal yazı rengi
      ),
    );
  }
}
