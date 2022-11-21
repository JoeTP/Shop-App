import 'package:flutter/material.dart';

abstract class AppColors {
  //TODO: make list rages from the red to green between them is yellow,
  //TODO: then make loop that divides the difference between DD nad NowDate to be the Loop step to get the selected color

  //+Cards
  static List<Color> itemColor = const [
    Color(0xffff1f1f),
    Color(0xfff3da00),
    Color(0xff00d31f),
      ];

  static Color titleColor = const Color(0xff000000);

  //+Home
  static Color homeAppBar = const Color(0x564f0075);
  static Color homeBgColor = const Color(0xff262626);

  //+Drawer section
  static Color drawerColor = const Color(0xff262626);

  static Color subjectAppBar = const Color(0xff262626);
  static Color subjectBgColor = const Color(0xff262626);

  static Color examsTableAppBar = const Color(0xff262626);
  static Color examsTableBgColor = const Color(0xff262626);

  static Color gpaAppBar = const Color(0xff262626);
  static Color gpaBgColor = const Color(0xff262626);

  static Color statisticsAppBar = const Color(0xff262626);
  static Color statisticsBgColor = const Color(0xff262626);

  static Color recordsAppBar = const Color(0xff262626);
  static Color recordsBgColor = const Color(0xff262626);
}
