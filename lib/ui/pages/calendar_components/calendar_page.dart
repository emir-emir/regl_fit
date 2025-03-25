import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:reglfit/constant/constants.dart';
import 'package:reglfit/ui/pages/calendar_components/circle_calendar.dart';
import 'package:reglfit/ui/pages/calendar_components/pieces_image_list.dart';
import 'package:reglfit/ui/pages/calendar_components/seven_day.dart';
import 'package:reglfit/widgets/custom_elevation_button.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../constant/gen/color_gen.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';
import 'cloud_calendar.dart';

class CalendarHomePage extends StatefulWidget {
  const CalendarHomePage({super.key});

  @override
  State<CalendarHomePage> createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Takvim"),
        centerTitle: true,
        actions: [
          CustomImageAsset(
            ImageUrl: 'assets/icons/kan1.png',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.5,
                    child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: "Adet Akışı",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Spacer(),
                                      CustomText(text: "11 Şubat", fontSize: 13),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      piecesImageComponentList.length,
                                      (index) => piecesImageComponentList[index],
                                    ),
                                  ),
                                ),
                                CustomElevatedButton(
                                  text: 'Tümünü Kaydet',
                                  backgroundColor: ColorGen.customColorBlue2,
                                  textColor: Colors.white,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        )),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Container(
        child: SfCalendar(
          view: CalendarView.month,
          initialDisplayDate: DateTime.now(),
          headerStyle: CalendarHeaderStyle(textAlign: TextAlign.center),
          cellBorderColor: Colors.transparent,
          // todayTextStyle: TextStyle(color: ColorGen.customColorWhite, fontSize: 12, fontWeight: FontWeight.bold),
          selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: ColorGen.customColorBlue4, width: 4),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            shape: BoxShape.rectangle,
          ),
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            navigationDirection: MonthNavigationDirection.vertical,
            showTrailingAndLeadingDates: false,
            monthCellStyle: MonthCellStyle(
              backgroundColor: ColorGen.customColorWhite2,
              todayBackgroundColor: ColorGen.customColorRed,
              textStyle: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),

          // todo ajanda

          onTap: (CalendarTapDetails details) {
            // hücrelerin tıklanma olayı
            if (details.targetElement == CalendarElement.calendarCell) {
              final DateTime? selectedDate = details.date;
              final String month = DateFormat.MMMM().format(selectedDate!);
              if (selectedDate.day == 7) {
                buildShowModalBottomSheet(context, selectedDate, month);
              } else {
                buildShowModalBottomSheet2(context, selectedDate, month);
              }
            }
          },
          monthCellBuilder: (BuildContext context, MonthCellDetails details) {
            Color backgroundColor;
            BorderRadiusGeometry? borderRadius;
            Color? textColor;

            final DateTime date = details.date;
            var cellIndex = date.day;
            final DateTime today = DateTime.now(); // şimdiki   tarih

            bool isToday = date.day == today.day; // bugünkü tarih

            final DateTime firstDayOfWeek = date.subtract(Duration(days: date.weekday - 1));
            final DateTime lastDayOfWeek = date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
            bool isFirstDayOfWeek = date == firstDayOfWeek;
            bool isLastDayOfWeek = date == lastDayOfWeek;

            final int currentWeek = (date.day - date.weekday + 10) ~/ 7; // Haftanın kaçıncı hafta olduğunu hesapla
            final int targetWeek = (today.day - today.weekday + 10) ~/ 7; // Geçerli haftayı hesapla
            bool isCurrentWeek = currentWeek == targetWeek;

            int firstValue = 9;
            int endValue = 12;
            int index = details.visibleDates.indexOf(details.date);
            bool isFour = index >= firstValue && index <= endValue;

            if (isCurrentWeek) {
              if (isFirstDayOfWeek || isLastDayOfWeek) {
                backgroundColor = ColorGen.customColorBlue3; // İlk ve son gün için farklı renk
                borderRadius = isFirstDayOfWeek ? const BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)) : BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0));
              } else {
                backgroundColor = ColorGen.customColorBlue3; // Geçerli haftanın diğer günleri için kırmızı
              }
            } else if (isFour) {
              textColor = Colors.white;
              backgroundColor = Colors.red.shade100;

              if (index == firstValue || index == endValue) {
                backgroundColor = Colors.red;

                borderRadius = index == firstValue ? const BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)) : BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0));
              }
            } else {
              backgroundColor = ColorGen.customColorWhite2; // Diğer haftalar için beyaz
            }

            Widget bottomSheet(MonthCellDetails details) {
              if (date.day == 7) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: Colors.red,
                  ),
                  width: 10.r,
                  height: 15.r,
                );
              }
              return SizedBox();
            }

            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorGen.customColorWhite2,
                ),
                child: Stack(children: [
                  //todo 1 : Haftanın 7 günü
                  SevenDayCalendar(backgroundColor: backgroundColor, borderRadius: borderRadius, cellIndex: '${date.day}', textColor: currentWeek == targetWeek ? Colors.blue : textColor),

                  // todo 2 : Yuvarlak alan

                  isToday ? CircleCalendar() : emptyWidget,
                  //todo 3 : Bulut 1
                  CloudImageCalendar(cellIndex: cellIndex),
                  bottomSheet(details)
                ]),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet2(BuildContext context, DateTime selectedDate, String month) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 1,
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "${selectedDate.day}  ${month}  tarihinde takip edildi",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        CustomText(
                          text: "Döngünün 2.günü",
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Center(
                        child: CustomText(
                          text: 'Takip edilen deneyim yok',
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context, DateTime selectedDate, String month) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 1, // Ekran yüksekliğinin 3/2'si
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "${selectedDate.day} ${month} tarihinde takip edildi",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        CustomText(
                          text: "Döngünün 1.günü",
                          fontWeight: FontWeight.w300,
                          fontSize: 10.r,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Image.asset(
                                    'assets/icons/kan1.png',
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "Adet: ",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "Orta",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                        )
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
