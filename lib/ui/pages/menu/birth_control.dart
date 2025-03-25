import 'package:flutter/material.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text_button.dart';
import '../login_components/slider.dart';
import 'birth_control_add.dart';

class BirthControlPage extends StatefulWidget {
  const BirthControlPage({super.key});

  @override
  State<BirthControlPage> createState() => _BirthControlPageState();
}

class _BirthControlPageState extends State<BirthControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textDescription(context),
              heightSpace20,
              methodButton,
              heightSpace20,
              birthControlButton,
              heightSpace20,
              birthControlAddButton,
            ],
          ),
        ),
      ),
    );
  }

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(text: "Doğum Kontrolü\n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  GestureDetector get methodButton {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: ColorGen.customColorWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              CustomText(
                text: "Yöntem",
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: ColorGen.customColorBlack,
              ),
              Spacer(),
              CustomText(
                text: "Tanımlanmamış",
                fontWeight: FontWeight.w200,
                fontSize: 15,
                color: ColorGen.customColorBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomElevatedButton get birthControlAddButton {
    return CustomElevatedButton(
      text: "Doğum kontrolünü ekle",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BirthControlAddPage()));
      },
      backgroundColor: ColorGen.customColorBlue2,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  CustomTextButton get birthControlButton {
    return CustomTextButton(
      text: 'Doğum kontrolü kullanmıyorum',
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
      },
      textColor: ColorGen.customColorBlue2,
      fontSize: 20,
      width: double.infinity,
    );
  }
}
