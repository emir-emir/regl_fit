import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reglfit/ui/pages/calendar_components/calendar_page.dart';
import 'package:reglfit/ui/pages/login_components/welcome_page.dart';
import '../../constant/gen/color_gen.dart';
import 'analysis_components/analysis_home_page.dart';
import 'contents_components/content_home_page.dart';
import 'follow_components/follow_page.dart';
import 'menstrual_cycle_components/menstrual_cycle_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool showWelcomePage = true; // İlk başta WelcomePage gösterilsin

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   checkWelcomePage();
  // }

  // void checkWelcomePage() {
  //   // Gerçek koşullarınızı burada kontrol edin
  //   bool conditionsMet = true; // Örnek koşul
  //
  //   if (conditionsMet) {
  //     setState(() {
  //       showWelcomePage = true; // Koşullar sağlanmışsa ana sayfayı göster
  //     });
  //   }
  //   // else {
  //   //   // Koşullar sağlanmazsa başka bir işlem yapabilirsiniz
  //   // }
  // }

  static List<Widget> widgetOptions = <Widget>[
    MenstrualCycleHomePage(),
    CalendarHomePage(),
    FollowHomePage(),
    AnalysisHomePage(),
    ContentHomePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Color(0xffDBF6FF),
              surfaceTintColor: Colors.white,
              labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 10,
              ))),
          child: NavigationBar(
            height: 70,
            selectedIndex: selectedIndex,
            onDestinationSelected: onItemTapped,
            destinations: [
              NavigationDestination(icon: Icon(FontAwesomeIcons.plus), label: 'Adet döngü'),
              NavigationDestination(icon: Icon(FontAwesomeIcons.calendarDays), label: 'Takvim'),
              NavigationDestination(icon: ClipRRect(borderRadius: BorderRadius.circular(20), child: Container(height: 40.r, width: 70.r, color: ColorGen.customColorBlue4, child: Icon(FontAwesomeIcons.plus, size: 40, color: Colors.white))), label: 'Takip et'),
              NavigationDestination(icon: Icon(FontAwesomeIcons.chartSimple), label: 'Analiz'),
              NavigationDestination(icon: Icon(FontAwesomeIcons.bookOpen), label: 'İçerik'),
            ],
          ),
        ),
      ),
    );
    // }
  }
}
