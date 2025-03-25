import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constant/gen/color_gen.dart';

class Date extends StatefulWidget {
  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  var tarih = DateTime.now();
  final DateFormat dateFormat = DateFormat.yMMMMd('tr_TR'); // Türkçe tarih formatı

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      headerBuilder: (BuildContext context, DateTime focusedDate) {
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dateFormat.format(focusedDate),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
      selectionMode: const SelectionMode.autoCenter(),
      firstDate: DateTime(2024),
      focusDate: tarih,
      lastDate: DateTime(2024, 12, 31),
      onDateChange: (selectedDate) {
        setState(() {
          tarih = selectedDate;
        });
      },
      dayProps: const EasyDayProps(width: 64.0, height: 64.0),
      itemBuilder: (BuildContext context, DateTime date, bool isSelected, VoidCallback onTap) {
        return InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: ColorGen.customColorWhite2,
              borderRadius: isSelected ? BorderRadius.circular(12) : null,
              border: Border.all(
                color: isSelected ? ColorGen.customColorBlue4 : Colors.transparent,
                width: 4,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  EasyDateFormatter.shortDayName(date, "tr_TR"),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
