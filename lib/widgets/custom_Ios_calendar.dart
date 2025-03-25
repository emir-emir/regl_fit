import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIosCalendarPage extends StatefulWidget {
  CustomIosCalendarPage({
    required this.title,
    this.dualDate,
    super.key,
  });

  String title;
  bool? dualDate = false;
  @override
  State<CustomIosCalendarPage> createState() => _CustomIosCalendarPageState();
}

class _CustomIosCalendarPageState extends State<CustomIosCalendarPage> {
  int _selectedNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: Container(
              height: 40.0,
              width: 370,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 2.0),
                  bottom: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: CupertinoPicker(
            backgroundColor: Colors.transparent,
            itemExtent: 38.0,
            scrollController: FixedExtentScrollController(initialItem: _selectedNumber - 1),
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedNumber = index + 1;
              });
            },
            children: List<Widget>.generate(90, (int index) {
              return Center(
                child: Text(("${index + 1} ${widget.title}  ").toString()),
              );
            }),
          ),
        ),
      ],
    );
  }
}
