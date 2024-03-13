import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color colorBlack = Color(0xff13161E);
  static const Color colorWhite = Color(0xffFFFFFF);
  // static const Color color000000 = Color(0xff000000);
  static const Color colorGray0 = Color(0xff1F2533);
  static const Color colorGray40 = Color(0xffB7C1DD);
  static const Color colorGray80 = Color(0xffEFF1F7);
  static const Color colorGray60 = Color(0xffDFE4F2);
  static const Color colorGray20 = Color(0xff687086);
  static const Color colorPrimaryBlue = Color(0xff4744CB);
  static const Color colorRed = Color(0xffFF1820);
  static const Color colorTertiaryRed = Color(0xffFFE3E3);
  static const Color colorGreen = Color(0xff00B749);
  static const Color colorSearchCard = Color.fromRGBO(197, 207, 235, 0.25);
  static const LinearGradient gradienSupport = LinearGradient(
    colors: [
      Color.fromRGBO(0, 246, 231, 1),
      Color.fromRGBO(0, 87, 255, 1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradienCurrentDebt = LinearGradient(
    begin: Alignment(-15.5, 55),
    end: Alignment(15.5, -55),
    colors: [
      Color(0xFF00FFC2),
      Color.fromARGB(155, 0, 255, 195),
      // Color.fromARGB(125, 0, 255, 195),
      // Color.fromARGB(100, 0, 255, 195),
      // Color.fromARGB(75, 0, 255, 195),
      // Color.fromARGB(55, 0, 255, 195),
      colorWhite,
      // colorWhite,
      // colorWhite,
      // Color.fromARGB(55, 0, 208, 255),
      // Color.fromARGB(30, 0, 208, 255),
      // Color.fromARGB(30, 0, 208, 255),
      // Color.fromARGB(55, 0, 208, 255),
      // Color.fromARGB(75, 0, 208, 255),
      // Color.fromARGB(100, 0, 208, 255),
      // Color.fromARGB(125, 0, 208, 255),
      // colorWhite,
      Color.fromARGB(155, 0, 208, 255),
      Color(0xFF00D1FF),
    ],
  );

  static const RadialGradient gradienRadialCurrentDebt = RadialGradient(
    center: Alignment(-2, 2.5),
    focal: Alignment(1.5, -5),
    stops: [
      0.8,
      //  0.5,
      0.8
    ],
    radius: 5,
    colors: [
      Color.fromARGB(255, 0, 255, 195),
      // colorWhite,
      Color.fromARGB(255, 0, 208, 255),
    ],
  );
  static const LinearGradient gradienQuestionAnswer = LinearGradient(
    colors: [
      Color.fromRGBO(0, 246, 84, 1),
      Color.fromRGBO(0, 175, 122, 1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient gradienSafety = LinearGradient(
    colors: [
      Color.fromRGBO(255, 168, 0, 1),
      Color.fromRGBO(255, 61, 0, 1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color colorTransparent = Colors.transparent;
}
