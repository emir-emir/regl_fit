import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/constant/gen/color_gen.dart';
import 'package:reglfit/constant/gen/font_size_gen.dart';
import 'package:reglfit/ui/pages/analysis_components/analysis_menstrual_flow.dart';
import 'package:reglfit/widgets/custom_text.dart';
import 'package:reglfit/widgets/custom_elevation_button.dart';
import '../../../widgets/custom_image.dart';
import 'analysis_circle_paint_page.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          // shrinkWrap: true,
          children: [
            topTitleAndImage(context),
            Rectangles,
            heightSpace,
            AnalysisMenstrualFlowPage(),
            heightSpace,
            analysisText(context),
            CustomElevatedButton(
              onTap: () {},
              text: "Clue Plus Al",
              textColor: ColorGen.customColorWhite,
              backgroundColor: ColorGen.customColorPurple2,
            ),
          ],
        ),
      ),
    );
  }

  RichText analysisText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Analizi Aç\n", style: FontSizeGen.titleLarge(context)?.copyWith(color: ColorGen.customColorPurple, fontWeight: FontWeight.bold)),
          TextSpan(text: "Geçmiş adet verilerinin derinliklerine dal ve\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple, fontWeight: FontWeight.normal)),
          TextSpan(text: "akışındaki düzenleri öğren\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorPurple, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  SingleChildScrollView get Rectangles {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          dualRectangle(title: "Döngü Uzunluğu", color: Color(0xff197a8b), isPoint: false),
          widthSpace,
          dualRectangle(title: "Döngü Değişkenliği", color: Color(0xffEBE7E4), isPoint: true),
        ],
      ),
    );
  }

  Row topTitleAndImage(BuildContext context) {
    return Row(
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(text: "Bir bakışta adet\ngeçmişin\n", style: FontSizeGen.titleLarge(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.bold)),
              TextSpan(text: "Bedenindeki düzenleri belirlemek için\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.normal)),
              TextSpan(text: "geçmiş döngülerine bak\n", style: FontSizeGen.titleMedium(context)?.copyWith(color: ColorGen.customColorBlack, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
        Spacer(),
        Expanded(
          child: ClipRRect(
            child: CustomImageAsset(ImageUrl: "assets/images/araba1.jpg", height: 100),
          ),
        ),
      ],
    );
  }

  Container dualRectangle({required String title, required Color color, required bool isPoint}) {
    return Container(
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorGen.customColorGrey.withOpacity(0.5),
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          heightSpace20,
          titleLoopRow(titleText: title),
          Expanded(
            child: AnalysisCirclePaintPage(color: color, isPoint: isPoint),
          ),
        ],
      ),
    );
  }

  Row titleLoopRow({required String titleText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: titleText,
          fontSize: 15,
        ),
        widthSpace15,
        const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        )
      ],
    );
  }
}
