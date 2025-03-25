import 'package:flutter/material.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/ui/pages/login_components/forgot_password.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text_button.dart';

class LoginEmailPage extends StatefulWidget {
  const LoginEmailPage({super.key});

  @override
  State<LoginEmailPage> createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              reglFitLogo(context),
              textDescription(context),
              epostaTextField,
              heightSpace20,
              passwordTextField,
              forgotPasswordButton,
              heightSpace60,
              continueButton,
            ],
          ),
        ),
      ),
    );
  }

  CustomElevatedButton get continueButton {
    return CustomElevatedButton(
      text: "Devam",
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginEmailPage()));
      },
      backgroundColor: ColorGen.customColorBlue5,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
    );
  }

  CustomTextButton get forgotPasswordButton {
    return CustomTextButton(
      text: 'şifremi unuttum',
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
      },
      textColor: ColorGen.customColorBlue5,
      fontSize: 18,
    );
  }

  Padding get passwordTextField {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: _isPasswordObscured, // Metnin gizli olmasını sağlar
        decoration: InputDecoration(
            labelText: 'Şifre',
            labelStyle: const TextStyle(color: ColorGen.customColorBlue2),
            fillColor: Colors.grey.shade200,
            filled: true,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorGen.customColorBlue2,
                width: 2.0,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(_isPasswordObscured ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isPasswordObscured = !_isPasswordObscured; // Durumu tersine çevir
                });
              },
            )),
        cursorColor: ColorGen.customColorBlue2,
        // Normal yazı rengi
      ),
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

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "\nE-Posta ile giriş yap\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(text: "\nLütfen devam edebilmek için\nbilgilerini gir.Şifreni unuttuysan\neğer sana yardım edeceğiz\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
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
