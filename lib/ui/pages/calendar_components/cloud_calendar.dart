import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CloudImageCalendar extends StatelessWidget {
  final int cellIndex;

  CloudImageCalendar({required this.cellIndex});

  @override
  Widget build(BuildContext context) {
    final List<int> randomNumberList=[];

    Random random = Random();
    for (int i = 0; i < 3; i++){
      int randomNumber= random.nextInt(25); // 0 ile 30 arasında bir tam sayı üretir
      randomNumberList.add(randomNumber);
    }
    for (int value in randomNumberList) {
      if (value == cellIndex) {
        return Positioned.fill(
          top: 15.r,
          child: Opacity(
            opacity: 0.4 ,
            child: Image.asset(
              'assets/images/cloud2.png',
              fit: BoxFit.fill,
            ),
          ),
        );
      }
    }
    // Eğer eşleşme yoksa boş bir Container döndür
    return Container();
  }
}
