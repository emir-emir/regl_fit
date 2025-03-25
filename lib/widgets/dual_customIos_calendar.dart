import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DualCustomIosCalendarPage extends StatefulWidget {
  DualCustomIosCalendarPage({
    this.dualDate,
    super.key,
  });

  bool? dualDate = false;
  @override
  State<DualCustomIosCalendarPage> createState() => _DualCustomIosCalendarPageState();
}

class _DualCustomIosCalendarPageState extends State<DualCustomIosCalendarPage> {
  int _selectedHour = 0;
  int _selectedMinute = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: CupertinoPicker(
              backgroundColor: Colors.transparent,
              itemExtent: 38.0,
              scrollController: FixedExtentScrollController(initialItem: _selectedHour - 1),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedHour = index + 1;
                });
              },
              children: List<Widget>.generate(24, (int index) {
                if (index < 9) {
                  return Text(("0${index + 1}   ").toString());
                }
                return Center(
                  child: Text(("${index + 1}    ").toString()),
                );
              }),
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              backgroundColor: Colors.transparent,
              itemExtent: 38.0,
              scrollController: FixedExtentScrollController(initialItem: _selectedMinute - 1),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedHour = index + 1;
                });
              },
              children: List<Widget>.generate(60, (int index) {
                if (index < 9) {
                  return Text(("0${index + 1}   ").toString());
                }
                return Center(
                  child: Text(("${index + 1}   ").toString()),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
