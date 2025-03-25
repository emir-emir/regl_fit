import 'package:flutter/material.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/constants.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../constant/gen/font_size_gen.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/custom_elevation_button.dart';
import '../../../widgets/custom_switch.dart';
import '../login_components/slider.dart';

class HealthRecord extends StatefulWidget {
  const HealthRecord({super.key});

  @override
  State<HealthRecord> createState() => _HealthRecordState();
}

class _HealthRecordState extends State<HealthRecord> {
  bool _isSwitchedValue = false;
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
                title: "Aşağıdaki hastalıklardan hiçbiri\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Endometriyozis\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Polikistik over sendromu(PCOS)\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Perimenopoz veya menopoz\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Hipotiroid\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Hipertiroidizm\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Rahim urları\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Anemi\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Düzensiz kanama(Willebran hastalığı gibi)\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Huzursuz bağırsak sendromu (IBS)\nInflamatuar bağırsak hastalığı (IBD)\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Diyabet\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Yüksek Tansiyon\n\n",
              ),
              textAndSwitchRow(
                context,
                title: "Tekrarlayan üriner sistem enfeksiyonu(UTI)\nveya bakteriyal vajinozis(BV)",
              ),
              textAndSwitchRow(
                context,
                title: "Kanser\n\n",
              ),
              heightSpace,
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
          TextSpan(text: "Sağlık Kaydım\n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(
              text: "Bu bizim ve arastirmacilarin bu saglik sorununu yasayan ve yasamayan insanlarin deneyimlerini daha iyi anlamamiza yardim eder. Birçok saglik\n\nsorunu âdet döngünü etkileyebilir veya"
                  "döngünden etkilenir. Aragtirma ile, döngüsü olan"
                  "herkesin sagligin iyileçtirebiliriz."
                  "Bu veriler aragtirma amaciyla kullanilacak ve dikkatle seçilen\n\nortaklarimiz ile paylagildiginda daima kimlikler silinecektir. Bu ayni zamanda"
                  "uygulamayi gelistirmemize de yardim eder.\n\n",
              style: FontSizeGen.titleMedium(context)?.copyWith(
                fontWeight: FontWeight.normal,
                color: ColorGen.customColorBlack,
              )),
          TextSpan(text: "Kayıtları Gir\n\n", style: FontSizeGen.headlineSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
          TextSpan(
              text: "Lütfen bir saglik uzmani tarafindan teshis edilen"
                  "tüm devam eden saglik sorunlarini seç.\n\n"
                  "Sadece hamilelik sirasinda görülen kisa süreli"
                  "sorunlari SEÇME.",
              style: FontSizeGen.titleMedium(context)?.copyWith(
                fontWeight: FontWeight.normal,
                color: ColorGen.customColorBlack,
              )),
        ],
      ),
    );
  }

  Widget textAndSwitchRow(
    BuildContext context, {
    String? title,
  }) {
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
                    TextSpan(text: title, style: FontSizeGen.titleSmall(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.normal)),
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
}
