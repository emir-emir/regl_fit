import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/ui/pages/login_components/sign_in_page.dart';
import 'package:reglfit/widgets/custom_Icon.dart';

import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_Ios_calendar.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_button.dart';
import '../../../widgets/dual_customIos_calendar.dart';

class MenstrualReminderPage extends StatefulWidget {
  const MenstrualReminderPage({super.key});

  @override
  State<MenstrualReminderPage> createState() => _MenstrualReminderPageState();
}

class _MenstrualReminderPageState extends State<MenstrualReminderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            textDescription1(context),
            heightSpace40,
            reminderContainer,
            heightSpace155,
            buttons,
          ],
        ),
      ),
    );
  }

  Container get reminderContainer {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5), // gölgenin konumu
          ),
        ],
      ),
      child: Column(
        children: [
          buildRow(
              title: "Program",
              subtitle: "1 gün önce",
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 1,
                      child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: "\nProgram belirle\n",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              const CustomText(
                                text: "Hatırlatmanı adetinin başlangıç tarihinden kaç gün\nönce istediğini seç\n",
                                fontSize: 15,
                              ),
                              CustomIosCalendarPage(
                                title: "Gün Önce",
                              ),
                              heightSpace70,
                              CustomElevatedButton(
                                text: 'Kaydet',
                                backgroundColor: ColorGen.customColorBlue2,
                                textColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )),
                    );
                  },
                );
              }),
          buildRow(
            title: "Zaman",
            subtitle: "12:00",
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 1,
                    child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(
                              text: "\nZaman belirle\n",
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomText(
                              text: "Hatırlatmanın ne zaman gönderilmesini istediğini seç\n",
                              fontSize: 15,
                            ),
                            DualCustomIosCalendarPage(),
                            heightSpace70,
                            CustomElevatedButton(
                              text: 'Kaydet',
                              backgroundColor: ColorGen.customColorBlue2,
                              textColor: Colors.white,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )),
                  );
                },
              );
            },
          ),
          buildRow(
              title: "Mesaj",
              subtitle: "Yeni döngün yakında başlayacak",
              onTap: () {

                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 1,
                      child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: "\nMesajı belirle\n",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              const CustomText(
                                text: " Görmek istediğin mesajı özelleştir.\n",
                                fontSize: 15,
                              ),
                              titleTextFormField(title: "Başlık", message: "ReglFit"),
                              titleTextFormField(title: "Mesaj", message: "Yeni döngün yakında başlayacak"),
                              heightSpace,
                              CustomElevatedButton(
                                text: 'Kaydet',
                                backgroundColor: ColorGen.customColorBlue2,
                                textColor: Colors.white,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )),
                    );
                  },
                );
              }),
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
            labelText: title, // 'Başlık',
            labelStyle: const TextStyle(color: ColorGen.customColorBlack),
            fillColor: Colors.white,
            filled: true,
            hintText: message, // "ReglFit",
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

  Widget buildRow({required String title, required String subtitle, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(text: title, fontSize: 18),
              Spacer(),
              CustomText(text: subtitle, fontWeight: FontWeight.w300),
              widthSpace,
              CustomIcon(
                icon: Icons.edit,
                iconColor: Colors.grey,
              ),
            ],
          ),
          Divider(thickness: 1, color: Colors.grey.shade400)
        ],
      ),
    );
  }

  RichText textDescription1(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Bir adet Hatırlatma\nalmak ister misin?\n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(text: "Sonraki adetin başlamadan önce hazırlıklı\n", style: FontSizeGen.titleSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.normal)),
          TextSpan(text: "hissetmek için bu hatırlatmayı kullanmalısın\n", style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
        ],
      ),
    );
  }

  Widget get buttons {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          CustomTextButton(
            text: 'Belki daha sonra',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
            },
            textColor: ColorGen.customColorBlue2,
            fontSize: 18,
          ),
          CustomElevatedButton(
            text: "Evet, aç",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
            },
            backgroundColor: ColorGen.customColorBlue2,
            textColor: ColorGen.customColorWhite,
            fontSize: 20,
          )
        ],
      ),
    );
  }
}
