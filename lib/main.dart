import 'package:bmi_calculator/view/calculate_screen.dart';
import 'package:bmi_calculator/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'view/splash_screen.dart';

void main() {
  runApp(
    Sizer(
      builder:(context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "home",
        routes: {
          '/':(p0) => Splashscreen(),
          'home':(context) => Homescreen(),
          'calculate':(context) => Calculatescreen(),
        },
      ),
    ),
  );
}
