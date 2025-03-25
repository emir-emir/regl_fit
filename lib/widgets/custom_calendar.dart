import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:reglfit/constant/gen/color_gen.dart';

import '../constant/constants.dart'; // flutter_localizations ekleyin

final today = DateUtils.dateOnly(DateTime.now());

class CustomCalendarPage extends StatefulWidget {
  const CustomCalendarPage({
    Key? key,
  });

  @override
  State<CustomCalendarPage> createState() => _CustomCalendarPageState();
}

class _CustomCalendarPageState extends State<CustomCalendarPage> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now().add(const Duration(days: 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: <Widget>[
        _buildSingleDatePickerWithValue(),
      ],
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values = values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null).toString().replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty ? values.map((v) => v.toString().replaceAll('00:00:00.000', '')).join(', ') : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1 ? values[1].toString().replaceAll('00:00:00.000', '') : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  Widget _buildSingleDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: ColorGen.customColorBlue2,
      weekdayLabels: ['Pt', 'Sa', 'Ça', 'Pe', 'Cu', 'Ct', 'Pz'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      daySplashColor: Colors.transparent,
      firstDayOfWeek: 1,
      controlsHeight: 50,
      dayMaxWidth: 25,
      animateToDisplayedMonthDate: true,
      controlsTextStyle: const TextStyle(
        color: ColorGen.customColorBlack,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      dayTextStyle: const TextStyle(
        color: ColorGen.customColorBlack,
        // fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      centerAlignModePicker: true,
      useAbbrLabelForMonthModePicker: true,
      modePickerTextHandler: ({required monthDate, isMonthPicker}) {
        if (isMonthPicker ?? false) {
          // Custom month picker text
          return '${getLocaleShortMonthFormat(const Locale('tr')).format(monthDate)} ';
        }

        return null;
      },
      firstDate: DateTime(DateTime.now().year - 54, DateTime.now().month - 1, DateTime.now().day - 5),
      lastDate: DateTime(DateTime.now().year + 3, DateTime.now().month + 2, DateTime.now().day + 10),
      // selectableDayPredicate: (day) =>
      //     !day.difference(DateTime.now().add(const Duration(days: 3))).isNegative &&
      //     day.isBefore(DateTime.now().add(
      //       const Duration(days: 30),
      //     )),
    );
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: 350,
            child: CalendarDatePicker2(
              displayedMonthDate: _singleDatePickerValueWithDefaultValue.first,
              config: config,
              value: _singleDatePickerValueWithDefaultValue,
              onValueChanged: (dates) => setState(() => _singleDatePickerValueWithDefaultValue = dates),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Seçilen Tarih :'),
              widthSpace,
              Text(
                _getValueText(
                  config.calendarType,
                  _singleDatePickerValueWithDefaultValue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
