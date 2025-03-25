import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reglfit/extensions/context_extension.dart';
import 'package:reglfit/ui/pages/login_components/forgot_password.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text_button.dart';
import '../contents_components/content_home_page.dart';
import 'slider.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool _isSwitchedValue = false;
  bool values = false;

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
              textAndSwitchRow(
                context,
                title: "Bilimsel arastirmalari gelistirmemize yardim et\n\n",
                subTitle: "Uygulamada takip ettigim sağlik verilerinin kimliklerinin"
                    "  silinmesini ve âdet ve.üreme sagligi çalismalarini"
                    " gelistirmek için Avrupa Birligi içinde ve disinda dikkatle"
                    " seçilmis arastirma ortaklariyla paylasilmasini kabul"
                    " ediyorum.",
              ),
              textAndSwitchRow(
                context,
                title: "Saglik analizleriyle özellikleri gelistir\n\n",
                subTitle: "Uygulamada takip ettigim sağlik verilerinin kimliklerinin"
                    "ReglFit'nun tahminlerimi iyilestirmesi,yeni algoritmalar geligtirmesi"
                    "ve kisisellestirlmis icgorülerle daha degerli özellikler olugturmasi "
                    "için analiz amaciyla uygulamada takip ettigim salk verilerinin islenmesini"
                    "kabul ediyorum.",
              ),
              textAndSwitchRow(
                context,
                title: "ReglFit'dan tavsiyelere izin ver\n\n",
                subTitle: "ReglFit'dan tavsiyelere izin ver"
                    "ReglFit'nun takip ettigim deneyimlere dayanarak ilgili"
                    "ürünler için kisisel tavsiyeler gönderebilmesi için ReglFit"
                    "uygulamsinda iletiçim verilerimin, kullanim verilerimin ve"
                    "takip ettigim saglik verilerimin islenmesini kabul"
                    "ediyorum. Buna yardim etmek için Avrupa Birligi diginda"
                    "bulunan bazilari da dahil olmak için bazi üçüncü taraf"
                    "saglayicilari da kullanilir.",
              ),
              textAndSwitchRow(
                context,
                title: "ReglFit'yu tanitmaya yardim et\n\n",
                subTitle: "ReglFit'nun, daha fazla insana ReglFit hakkinda daha etkin"
                    "olarak bilgi vermesi ve reklam çabalarini optimize"
                    "etmesi için kullanim ve cihaz verilerimin islenmesini"
                    "kabul ediyorum. Buna yardim etmek için Avrupa Birligi disinda bulunan"
                    "bazilari da dahil olmak için bazi üçüncü taraf saglayicilari da kullanilir.",
              ),
              textAndSwitchRow(
                context,
                title: "ReglFit uygulamasını teknik olarak geliştir\n\n",
                subTitle: "ReglFit'nun gizlilik politikasında ana hatalrıyla verildiği gibi ve ReglFit'nun uygulamayı sürekli"
                    "geliştirmek için bir şirket olark geçerli çıkarına dayanarak bazı kullanım verileri "
                    "ve teknik veriler işlenir.Bundan herhangi bir zamanda vazgeçme hakkına sahibim",
              ),
              heightSpace,
              Divider(thickness: 1, color: Colors.grey),
              textDescription2,
              Divider(thickness: 1, color: Colors.grey),
              checkboxText(context),
              buttons(
                title: "Seçimi Onayla",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SliderPage()));
                },
              ),
              buttons(
                title: "Tümünü kabul et",
                backgroundColor: ColorGen.customColorBlue3,
                textColor: ColorGen.customColorBlue2,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SliderPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText textDescription(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Gizliliğin önce gelir\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(
              text: "\nSana doğru deneyimi vermek için bize yardımet ve\n gizlilik ayarlarını belirle.Kendi verilerin ve gizliliğinin\nkontrolünün sende olması gerektiğine inanıyoruz\n",
              style: FontSizeGen.titleSmall(context)?.copyWith(
                fontWeight: FontWeight.normal,
                color: ColorGen.customColorBlack,
              )),
        ],
      ),
    );
  }

  Widget textAndSwitchRow(BuildContext context, {String? title, String? subTitle}) {
    return Column(
      children: [
        Divider(thickness: 1, color: Colors.grey.shade400),
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(text: title, style: FontSizeGen.titleSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
                    TextSpan(text: subTitle, style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {},
                          child: const CustomText(
                            text: "Daha fazla ögren",
                            color: ColorGen.customColorBlue2,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            // widthSpace15,
            CustomSwitch(
              value: _isSwitchedValue,
              activeColor: ColorGen.customColorWhite,
              activeTrackColor: ColorGen.customColorBlue2,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              autofocus: true,
              onChanged: (bool value) {
                setState(() {
                  _isSwitchedValue = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  CustomText get textDescription2 {
    return CustomText(
      textAlign: TextAlign.center,
      text: "ReglFit bu tercihleri açmadan da kullanabilirsin.\nOnayını herhangi bir zamanda geri alabilirsin",
      color: ColorGen.customColorGrey.shade600,
    );
  }

  CustomCheckbox checkboxText(BuildContext context) {
    return CustomCheckbox(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Yukaridaki politikalari ebeveynime/hâmime"
                    "gönderdim, ReglFit!'yu kullanmami ve ReglFit'nun"
                    "saglk verilerimi islemesini kabul ettiler.",
                style: FontSizeGen.titleSmall(context)?.copyWith(fontWeight: FontWeight.normal, color: ColorGen.customColorBlack)),
          ],
        ),
      ),
      value: values,
      onChanged: (bool? value) {
        setState(() {
          values = value ?? false;
        });
      },
    );
  }

  Widget buttons({Function()? onTap, String? title, Color? backgroundColor, Color? textColor}) {
    return CustomElevatedButton(
      text: title!,
      onTap: onTap ?? () {},
      backgroundColor: backgroundColor ?? ColorGen.customColorBlue2,
      textColor: textColor ?? ColorGen.customColorWhite,
      fontSize: 20,
    );
  }
}
