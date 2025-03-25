import 'package:flutter/material.dart';
import 'package:reglfit/widgets/custom_Icon.dart';
import 'package:reglfit/widgets/custom_text.dart';
import '../../../constant/gen/color_gen.dart';

class LegaPage extends StatefulWidget {
  const LegaPage({super.key});
  @override
  State<LegaPage> createState() => _LegaPageState();
}

class _LegaPageState extends State<LegaPage> {
  bool isThreeRow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Yasal",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            buildRow(title: "Gizlilik Politikası", onTap: () {}),
            buildRow(title: "Hizmet Koşulları", onTap: () {}),
            buildRow(title: "Künye", onTap: () {}),
            buildRow(title: "ReglFit Etiketi", onTap: () {}),
          ],
        ),
      ),
    );
  }

  CustomText titleRow({String? title}) {
    return CustomText(
      text: title!,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  Widget buildRow({required String title, required Function() onTap, IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorGen.customColorWhite,
            ),
            child: Row(
              children: [
                CustomText(text: title, fontSize: 18),
                Spacer(),
                CustomIcon(
                  icon: icon ?? Icons.arrow_forward_ios,
                  iconColor: ColorGen.customColorBlack,
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: Colors.grey.shade400)
        ],
      ),
    );
  }

  Padding titleTextFormField({String? title, String? message}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          maxLength: 150,
          decoration: InputDecoration(
            labelText: title,
            // 'Başlık',
            labelStyle: const TextStyle(color: ColorGen.customColorBlack),
            fillColor: Colors.white,
            filled: true,
            hintText: message,
            // "ReglFit",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorGen.customColorBlack, width: 2.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorGen.customColorBlack, width: 2.0),
            ),
          )),
      // Normal yazı rengi
    );
  }
}
