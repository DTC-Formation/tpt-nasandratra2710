import 'package:dtc_online_course/view/screens/accueil.dart';
import 'package:dtc_online_course/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const DtcOnlineCourse());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class DtcOnlineCourse extends StatelessWidget {
  const DtcOnlineCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dtc Online Course',
      theme: ThemeData(
        scaffoldBackgroundColor: appBgColor,
        primaryColor: primary,
      ),
      home: Accueil(),
    );
  }
}
