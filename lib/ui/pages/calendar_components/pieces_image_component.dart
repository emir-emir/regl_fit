import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/widgets/custom_image.dart';
import 'package:reglfit/widgets/custom_text.dart';

class PiecesImageComponent extends StatefulWidget {
  PiecesImageComponent({
    this.ImageUrl,
    this.ImageText,
    this.borderRadius = 20,
    this.onTap,
    this.borderColor = Colors.red,
    super.key,
  });

  String? ImageUrl;
  String? ImageText;
  double? borderRadius;
  Color borderColor;

  void Function()? onTap;

  @override
  State<PiecesImageComponent> createState() => _PiecesImageComponentState();
}

class _PiecesImageComponentState extends State<PiecesImageComponent> {
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: Container(
                  width: 90.r,
                  height: 90.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius!),
                    border: isClicked ? Border.all(color: widget.borderColor, width: 4.0) : Border.all(color: Colors.blue, width: 4.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius!),
                    child: CustomImageAsset(
                      ImageUrl: widget.ImageUrl!,
                    ),
                  ),
                ),
              ),
            ),
            heightSpace10,
            CustomText(text: widget.ImageText!),
          ],
        )
      ],
    );
  }
}
