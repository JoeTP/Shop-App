import 'package:flutter/material.dart';

import 'colors/colors.dart';

dynamic token = '';
final queryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
double screenHeight = queryData.size.height;
double screenWidth = queryData.size.width;



double p5 = screenHeight / 166.9818182;
double p10 = screenHeight / 83.49090909;
double p15 = screenHeight / 55.66060606;
double p20 = screenHeight / 41.74545455;
double p25 = screenHeight / 33.39636364;
double p30 = screenHeight / 27.83030303;
double p35 = screenHeight / 23.85454545;
double p40 = screenHeight / 20.87272727;
double p45 = screenHeight / 18.55353535;
double p50 = screenHeight / 16.69818182;
double p70 = screenHeight / 11.92727273;
double p75 = screenHeight / 11.13212121;
double p80 = screenHeight / 10.43636364;
double p85 = screenHeight / 9.822459893;
double p90 = screenHeight / 9.276767677;
double p95 = screenHeight / 8.788516746;

//font
double f16 = screenHeight / 10;
double f34 = screenHeight / 24.55614973;

//radius
double r15 = screenHeight / 55.66060606;
double r20 = screenHeight / 41.74545455;

//icon size
double i24 = screenHeight / 5;


// class Dim {
//   // static double screenHeight = Get.context!.height; //834.9090909090909
//   // static double screenWidth = Get.context!.width; //392.72727272727275
//   // static double screenHeight = 834.9090909090909; //834.9090909090909
//   // static double screenWidth = 392.72727272727275; //392.72727272727275
//
//   //we need to get factor that is the result of dividing the screen dimensions by the container dimensions
//   // factor = screen/container
//
//   //dynamic dimensions
//   static double p5 = screenHeight / 166.9818182;
//   static double p10 = screenHeight / 83.49090909;
//   static double p15 = screenHeight / 55.66060606;
//   static double p20 = screenHeight / 41.74545455;
//   static double p25 = screenHeight / 33.39636364;
//   static double p30 = screenHeight / 27.83030303;
//   static double p35 = screenHeight / 23.85454545;
//   static double p40 = screenHeight / 20.87272727;
//   static double p45 = screenHeight / 18.55353535;
//   static double p50 = screenHeight / 16.69818182;
//   static double p70 = screenHeight / 11.92727273;
//   static double p75 = screenHeight / 11.13212121;
//   static double p80 = screenHeight / 10.43636364;
//   static double p85 = screenHeight / 9.822459893;
//   static double p90 = screenHeight / 9.276767677;
//   static double p95 = screenHeight / 8.788516746;
//
//   //font
//   static double f16 = screenHeight / 10;
//   static double f34 = screenHeight / 24.55614973;
//
//   //radius
//   static double r15 = screenHeight / 55.66060606;
//   static double r20 = screenHeight / 41.74545455;
//
//   //icon size
//   static double i24 = screenHeight / 5;
//
//   static double? schedHeight;
// }
