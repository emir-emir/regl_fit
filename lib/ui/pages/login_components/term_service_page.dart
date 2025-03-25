import 'package:flutter/material.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/widgets/custom_text.dart';
import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import 'choose_mode.dart';

class TermServicePage extends StatefulWidget {
  const TermServicePage({super.key});

  @override
  State<TermServicePage> createState() => _TermServicePageState();
}

class _TermServicePageState extends State<TermServicePage> {
  bool isChecked = false;
  List<bool> values = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            reglFitLogo(context),
            textDescription(context),
            heightSpace20,
            checkboxRow(
              context: context,
              value: values[0],
              onChanged: (bool? value) {
                setState(() {
                  values[0] = value ?? false;
                });
              },
              title1: "ReglFit'in ",
              title2: " Hizmet koşullarını ",
              title3: "Kabul ediyorum",
            ),
            checkboxRow(
              context: context,
              value: values[1],
              onChanged: (bool? value) {
                setState(() {
                  values[1] = value ?? false;
                });
              },
              title1: "ReglFit'in ",
              title2: "Gizlilik Politikasını ",
              title3: "Kabul ediyorum",
            ),
            checkboxRow(
              context: context,
              value: values[2],
              onChanged: (bool? value) {
                setState(() {
                  values[2] = value ?? false;
                });
              },
              title1: "ReglFit'in  hizmetinin sağlayabilmesi için\nRegl Fit'in uygulamayla paylaşmayı\nseçtiğim sağlık verilerini işlemesini kabul\nediyorum",
              title2: "",
              title3: "",
            ),
            heightSpace80,
            continueButton,
          ],
        ),
      ),
    );
  }

  CustomCheckbox checkboxRow({
    required BuildContext context,
    required bool value,
    Function(bool?)? onChanged,
    String? title1,
    String? title2,
    String? title3,
  }) {
    return CustomCheckbox(
      title: RichText(
        // textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(text: title1, style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: () {},
                child: Text(title2!, style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlue2)),
              ),
            ),
            TextSpan(text: title3, style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
          ],
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }

  CustomElevatedButton get continueButton {
    return CustomElevatedButton(
      text: "Sonraki",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseModePage()));
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
          TextSpan(
              text: "\nSen ve ReglFit\n",
              style: FontSizeGen.headlineSmall(context)?.copyWith(
                color: ColorGen.customColorBlack,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: "\nVerilerini güvende,emniyetli ve özel tutacağımıza söz veriyoruz.Lüften Politikalarımızı\ntanımak için biraz zaman ayır\n",
              style: FontSizeGen.titleSmall(context)?.copyWith(
                fontWeight: FontWeight.normal,
                color: ColorGen.customColorBlack,
              )),
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
