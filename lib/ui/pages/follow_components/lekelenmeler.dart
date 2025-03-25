import 'package:flutter/material.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/widgets/custom_elevation_button.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../widgets/custom_text.dart';
import '../calendar_components/pieces_image_list.dart';
import 'date.dart';

class Lekelenmeler extends StatefulWidget {
  const Lekelenmeler({super.key});

  @override
  State<Lekelenmeler> createState() => _LekelenmelerState();
}

class _LekelenmelerState extends State<Lekelenmeler> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // shrinkWrap: true,
      children: [
        heightSpace20,
        Date(),
        imageTitle(title: "Adet"),
        heightSpace10,
        RowImageContainer(ImageList: piecesImageComponentList),
        heightSpace20,
        imageTitle(title: "Lekelenme"),
        heightSpace10,
        RowImageContainer(ImageList: StainImageComponentList),
        heightSpace20,
        imageTitle(title: "Duygular"),
        heightSpace10,
        RowImageContainer(ImageList: feelingImageComponentList),
        heightSpace20,
        saveButton,
      ],
    );
  }

  CustomElevatedButton get saveButton {
    return CustomElevatedButton(
      onTap: () {},
      text: "Kaydet",
      backgroundColor: ColorGen.customColorBlue2,
      textColor: ColorGen.customColorWhite,
      width: double.maxFinite,
    );
  }

  SingleChildScrollView RowImageContainer({required List<dynamic> ImageList}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            ImageList.length,
            // piecesImageComponentList.length,
            // (index) => piecesImageComponentList[index],
            (index) => ImageList[index],
          ),
        ),
      ),
    );
  }

  Padding imageTitle({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          CustomText(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
