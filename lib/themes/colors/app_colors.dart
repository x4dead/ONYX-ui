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
  static const LinearGradient gradienSupport = LinearGradient(
    colors: [
      Color(0xffF6E7FF),
      Color(0xff57FFFF),
    ],
  );
  static const LinearGradient gradienCurrentDebt = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xff00FFC2),
      Color(0xff00D1FF),
    ],
  );
  static const LinearGradient gradienQuestionAnswer = LinearGradient(
    colors: [
      Color.fromRGBO(0, 246, 84, 1),
      Color.fromRGBO(0, 175, 122, 1),
    ],
  );
  static const LinearGradient gradienSafety = LinearGradient(
    colors: [
      Color.fromRGBO(255, 168, 0, 1),
      Color.fromRGBO(255, 61, 0, 1),
    ],
  );

  static const Color colorTransparent = Colors.transparent;
}
