import 'package:flutter/cupertino.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/utils/extentions/figma_height.dart';

abstract class AppTextStyle {
  static const TextStyle w500s18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  static TextStyle w600s39point47 = TextStyle(
    fontSize: 39.47,
    height: 48.35.toFigmaHeight(39.47),
    fontWeight: FontWeight.w600,
    color: AppColors.colorPrimaryBlue,
  );
  static const TextStyle w600s32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.colorGray0,
  );
  static TextStyle w800s14point45 = TextStyle(
    fontSize: 14.45,
    height: 18.07.toFigmaHeight(14.45),
    fontWeight: FontWeight.w800,
    color: AppColors.colorPrimaryBlue,
  );
  static TextStyle w800s12point93fSF = TextStyle(
    fontSize: 12.93,
    height: 15.43.toFigmaHeight(12.93),
    fontWeight: FontWeight.w800,
    fontFamily: "SF Pro Display",
    color: AppColors.colorPrimaryBlue,
  );
  static const TextStyle w600s16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle w600s15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle w600s24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle w500s14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 17.0.toFigmaHeight(14));
  static const TextStyle w500s15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle w500s16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    // height: 19.0.toFigmaHeight(16)
  );

  // static const TextStyle w500s12 =
  //     TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  static const TextStyle w500s10 =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w500);

  // static TextStyle w500s18Ellipsis = TextStyle(
  //     fontSize: 18,
  //     fontWeight: FontWeight.w500,
  //     overflow: TextOverflow.ellipsis,
  //     height: 13.0.toFigmaHeight(18));

  static const TextStyle w500s18point14 = TextStyle(
    fontSize: 18.14,
    fontWeight: FontWeight.w500,
    // overflow: TextOverflow.ellipsis,
  );
  static const TextStyle w400s16fSF = TextStyle(
      fontFamily: 'SF Pro Display', fontSize: 16, fontWeight: FontWeight.w400);

  // static const TextStyle w400s14 =
  //     TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  // static const TextStyle w500s20 =
  //     TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const TextStyle w600s27 = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle w600s20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

  // static TextStyle w400s15SFProDisplay = TextStyle(
  //   height: 24.0.toFigmaHeight(15),
  //   letterSpacing: 0.3,
  //   fontSize: 15,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.colorDarkGray,
  //   fontFamily: 'SF Pro Display',
  // );
}
