import 'package:flutter/material.dart';
import 'package:reglfit/extensions/context_extension.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';

class BirthControlAddPage extends StatefulWidget {
  const BirthControlAddPage({super.key});

  @override
  State<BirthControlAddPage> createState() => _BirthControlAddPageState();
}

class _BirthControlAddPageState extends State<BirthControlAddPage> {
  // Checkbox durumlarını takip etmek için bir map kullanıyoruz
  Map<String, bool> values = {
    "Hiçbiri": false,
    "Kombine hap": false,
    "Mini hap": false,
    "Enjeksiyon": false,
    "Dogum Kontrol Bandi": false,
    "Gebelik Önleyici Halka": false,
    "implant": false,
    "Bakır RIA": false,
    "Hormonlu RIA": false,
    "Prezervatif": false,
    "Dogurganlik Farkindaligi Yöntemi": false,
    "Diger": false,
  };

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
              reglFitLogo,
              SizedBox(height: 20),
              textDescription(context),
              ..._buildCheckboxList(context),
              SizedBox(height: 20),
              continueButton,
            ],
          ),
        ),
      ),
    );
  }

  CustomElevatedButton get continueButton {
    return CustomElevatedButton(
      text: "Sonraki",
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => BeforeStartPage()));
      },
      backgroundColor: ColorGen.customColorBlue2,
      textColor: ColorGen.customColorWhite,
      fontSize: 20,
      width: 300,
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

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Doğum Kontrolünü seç\n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(text: "Bu sana daha yararlı olması için uygulamayı\nuyarlamamıza yardım eder.\n", style: FontSizeGen.titleSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  List<Widget> _buildCheckboxList(BuildContext context) {
    return values.keys.map((key) {
      return checkboxText(
        context,
        title: key,
        subTitle: getSubtitle(key),
      );
    }).toList();
  }

  String? getSubtitle(String key) {
    switch (key) {
      case "Kombine hap":
        return "\nGenellikle hap denen en sık rastlanan doğum kontrol türü estrojen hormonu ve projestin içerir.";
      case "Mini hap":
        return "\nMini pil sadece hormon progestin içerir. estrogen içermez (estradiol)";
      case "Enjeksiyon":
        return "\nEnjeksiyon yoluyla uygulanir ve progestin içerir.";
      case "Dogum Kontrol Bandi":
        return "\nYama cildin üstüne yerlestirilir ve estrogen ve progestin gormonlari içerir";
      case "Gebelik Önleyici Halka":
        return "\nHalka vajinanin içine yerlestirilir ve estrogen ve progestin içerir.";
      case "implant":
        return "\nImplant kolun üst tarafina yerlestirilen ince bir çubuktur ve progestin hormonu içerir.";
      case "Bakır RIA":
        return "\nBakir RIA hormonsuzdur ve 5 ila 10 yil hamilelikten korur.";
      case "Hormonlu RIA":
        return "\nHormonlu RIA türüne bagli olarak farklı dozlarda hormon içerir ve 3 ila 7 yil için rahim içine yerleçtirilir.";
      case "\nPrezervatif":
        return "\nJenital bölgeyi kapatan ve vücut sivilarina karsi bariyer olusturan erkek ve kadin prezervatifleri.";
      case "Dogurganlik Farkindaligi Yöntemi":
        return "\nDogurganlik farkindaligina dayalı yöntemler (FABM'ler) kiside ne zaman ovülasyon gerçeklesecegini ve ne zaman seksten kaçinmasi gerektigi veya hamile kalmamak için koruma kullanacagini tahmin eder.";
      case "Diger":
        return "\nBuna süngerler, spermisitler, servikal kapak, vajina jelleri veya diyaframlar.";
      default:
        return null;
    }
  }

  Widget checkboxText(BuildContext context, {required String title, String? subTitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorGen.customColorWhite,
        border: Border.all(
          color: values[title]! ? ColorGen.customColorBlue2 : ColorGen.customColorGrey,
          width: 2.0,
        ),
      ),
      child: CustomCheckbox(
        listTileControlAffinity: ListTileControlAffinity.trailing,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: title, style: FontSizeGen.titleMedium(context)?.copyWith(fontWeight: FontWeight.bold, color: ColorGen.customColorBlack)),
              TextSpan(text: subTitle, style: FontSizeGen.titleMedium(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
            ],
          ),
        ),
        value: values[title]!,
        onChanged: (bool? value) {
          setState(() {
            values[title] = value ?? false;
          });
        },
      ),
    );
  }
}
