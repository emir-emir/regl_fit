import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SevenDayCalendar extends StatelessWidget {
  SevenDayCalendar({this.backgroundColor, this.borderRadius, this.cellIndex, this.textColor, super.key});

  Color? backgroundColor;
  BorderRadiusGeometry? borderRadius;
  String? cellIndex;
  Color? textColor  ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: double.infinity,
        height: 20.r,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        padding: EdgeInsets.only(right: 10.r, bottom: 3.r),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            // date.day.toString(),
            '$cellIndex',
            // textAlign: TextAlign.right,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
