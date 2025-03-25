import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/gen/border_radius_gen.dart';
import '../../../constant/gen/paddig_gen.dart';
import '../../../widgets/custom_text.dart';
import 'mode_page.dart';

class DropDownButtonPage extends StatefulWidget {
  const DropDownButtonPage({super.key});

  @override
  State<DropDownButtonPage> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonPage> {
  @override
  Widget build(BuildContext context) {
    List<String> category = [
      "Clue Adet Takibi",
      "Clue Hamile Kal",
      "Clue Hamilelik",
      "Clue Perimenopoz",
    ];
    String selectedCategory = category[0];
    return dropdownButton(
      selectedCategory,
      category,
    );
  }

  GestureDetector dropdownButton(String selectedCategory, List<String> category) {
    return GestureDetector(
      onTap: () {
        print("deneme");
      },
      child: Padding(
        padding: PaddingGen.buildPaddingHorizontal40,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffDBF6FF),
            borderRadius: BorderRadiusGen.allCircular30,
          ),
          child: DropdownButtonFormField(
              isExpanded: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
              ),
              value: selectedCategory,
              iconSize: 40,
              iconEnabledColor: Colors.black87,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ModePage()),
                  );
                });
              },
              items: [
                for (var categorylist in category)
                  DropdownMenuItem(
                      value: categorylist,
                      child: CustomText(
                        text: categorylist,
                        fontSize: 17.r,
                        fontWeight: FontWeight.bold,
                      )),
              ]),
        ),
      ),
    );
  }
}
