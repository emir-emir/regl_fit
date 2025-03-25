import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/widgets/custom_elevation_button.dart';
import 'package:reglfit/widgets/custom_text.dart';
import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_image.dart';
import 'before_start_page.dart';

class BirthdayPage extends StatefulWidget {
  BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  String selectedDate = "";

  showDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('Onayla', style: TextStyle(color: Colors.blue)),
        cancel: Text('İptal', style: TextStyle(color: Colors.red)),
      ),
      minDateTime: DateTime(1990, 01, 01),
      maxDateTime: DateTime(2030, 6, 6),
      initialDateTime: DateTime.now(),
      dateFormat: 'yyyy-MMMM-dd',
      locale: DateTimePickerLocale.tr,
      onChange: (dateTime, List<int> index) {
        setState(() {
          selectedDate = dateTime.toString().split(' ')[0];
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          selectedDate = dateTime.toString().split(' ')[0];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          heightSpace50,
          reglFitLogo(context),
          heightSpace30,
          textDescription(context),
          CustomText(
            text: '$selectedDate',
            fontSize: 18,
          ),
          CustomElevatedButton(
            text: "Tarih Seç",
            onTap: showDatePicker,
            backgroundColor: ColorGen.customColorBlue5,
            textColor: ColorGen.customColorWhite,
            fontSize: 20,
            width: 300,
          ),
          Spacer(),
          CustomElevatedButton(
            text: "Sonraki",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BeforeStartPage()));
            },
            backgroundColor: ColorGen.customColorBlue5,
            textColor: ColorGen.customColorWhite,
            fontSize: 20,
            width: 300,
          ),
          heightSpace30,
        ],
      ),
    );
  }

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Ne zaman doğdun ? \n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(text: "Döngüler zaman içinde değişebildiğin için,bu\n", style: FontSizeGen.titleSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.normal)),
          TextSpan(text: "uygulamayı senin için özelleştirmemize yardım\nedecektir.\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
        ],
      ),
    );
  }

  Align reglFitLogo(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageAsset(
        alignment: Alignment.center,
        ImageUrl: "assets/images/pasta.jpg",
        height: context.height / 6,
        width: context.width / 2,
      ),
    );
  }
}
