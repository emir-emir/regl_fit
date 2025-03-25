import 'package:flutter/material.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/ui/pages/login_components/security_page.dart';
import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            reglFitLogo(context),
            textDescription(context),
            nameAndMailTextField(title: "Ad"),
            heightSpace20,
            nameAndMailTextField(title: "E-posta"),
            heightSpace20,
            passwordTextField,
            heightSpace60,
            continueButton,
          ],
        ),
      ),
    );
  }

  CustomElevatedButton get continueButton {
    return CustomElevatedButton(
      text: "Devam",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityPage()));
      },
      backgroundColor: ColorGen.customColorBlue5,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
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

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "\nHesabını oluştur\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(text: "\nBilgilerini gir ve en az 10 karakter olan şifre\nseç\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
        ],
      ),
    );
  }

  Padding nameAndMailTextField({String? title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: title,
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
}
