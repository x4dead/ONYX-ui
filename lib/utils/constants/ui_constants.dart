import 'package:flutter/material.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';

///SizedBox const

const kSBW15 = SizedBox(width: 15);
const kSBW14 = SizedBox(width: 14);
const kSBH14 = SizedBox(height: 14);
const kSBH25 = SizedBox(height: 25);
const kSBH99 = SizedBox(height: 99);
const spacer = Spacer();
const kSBH50 = SizedBox(height: 50);
const kSBH45 = SizedBox(height: 45);
const kSBH10 = SizedBox(height: 10);
const kSBH11 = SizedBox(height: 11);
const kSBH12 = SizedBox(height: 12);
const kSBH13 = SizedBox(height: 13);
const kSBH32 = SizedBox(height: 32);
const kSBW10 = SizedBox(width: 10);
const kSBW12 = SizedBox(width: 12);
const kSBW20 = SizedBox(width: 20);
const kSBH20 = SizedBox(height: 20);
const kSBH22 = SizedBox(height: 22);
const kSBH18 = SizedBox(height: 18);
const kSBH40 = SizedBox(height: 40);
const kSBH15 = SizedBox(height: 15);
const kSBH16 = SizedBox(height: 16);
const kSBW16 = SizedBox(width: 16);
const kSBW6 = SizedBox(width: 6);
const kSBH6 = SizedBox(height: 6);
const kSBH5 = SizedBox(height: 5);
const kSBH5dot28 = SizedBox(height: 5.28);
const kSBH60dot36 = SizedBox(height: 60.36);
const kSBH4 = SizedBox(height: 4);
const kSBH2 = SizedBox(height: 2);
const kSBH8 = SizedBox(height: 8);
const kSBH96 = SizedBox(height: 96);
const kNothing = SizedBox.shrink();

///Padding
const kPH20V12 = EdgeInsets.symmetric(horizontal: 20, vertical: 12);
const kPH10V6 = EdgeInsets.symmetric(horizontal: 10, vertical: 6);
const kPH12 = EdgeInsets.symmetric(horizontal: 12);
const kPH24V18 = EdgeInsets.symmetric(horizontal: 24, vertical: 18);
const kPH14T16B18 = EdgeInsets.fromLTRB(14, 16, 14, 18);
const kPH21 = EdgeInsets.symmetric(horizontal: 21);
const kPH16 = EdgeInsets.symmetric(horizontal: 16);
const kPL15R14 = EdgeInsets.only(left: 15, right: 14);
const kPH6 = EdgeInsets.symmetric(horizontal: 6);
const kPZero = EdgeInsets.zero;
const kPAll6 = EdgeInsets.all(6);
const kPAll20 = EdgeInsets.all(20);
const kPAll10 = EdgeInsets.all(10);
const kPV12R12 = EdgeInsets.fromLTRB(0, 12, 12, 12);
const kPV10 = EdgeInsets.symmetric(vertical: 10);
const kPV15 = EdgeInsets.symmetric(vertical: 15);
const kPH45V25 = EdgeInsets.symmetric(horizontal: 45, vertical: 25);
const kPH20 = EdgeInsets.symmetric(horizontal: 20);
const kPH20V18Dot5 = EdgeInsets.symmetric(horizontal: 20, vertical: 18.5);

///BorderRadius
// const Radius circleRadius12 = Radius.circular(12);

///Size
const double bookedGuestSize = 46;
const kS36 = Size(36, 36);

// const bottomBorder = Border(
//     bottom: BorderSide(
//         color: AppColors.colorLightGray,
//         width: 1,
//         strokeAlign: BorderSide.strokeAlignInside));
const allCircularRadius12 = BorderRadius.all(Radius.circular(12));
const roundedBoxDecoration = BoxDecoration(borderRadius: allCircularRadius12);
ColorFilter svgColorFilter({Color? color}) =>
    ColorFilter.mode(color ?? AppColors.colorGray0, BlendMode.srcIn);

const List<String> shortWeekDays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];
const languages = ['Русский язык', 'Қазақша'];
// const List<String> weekDays = [
//   "Понедельник",
//   "Вторник",
//   "Среда",
//   "Четверг",
//   "Пятница",
//   "Суббота",
//   "Воскресенье",
// ];
// const List<String> months = [
//   'Январь',
//   'Февраль',
//   'Март',
//   'Апрель',
//   'Май',
//   'Июнь',
//   'Июль',
//   'Август',
//   'Сентябрь',
//   'Октябрь',
//   'Ноябрь',
//   'Декабрь',
// ];
const List<String> middleMonthRu = [
  "Янв",
  "Фев",
  "Мар",
  "Апр",
  "Май",
  "Июн",
  "Июл",
  "Авг",
  "Сен",
  "Окт",
  "Ноя",
  "Дек",
];
const List<String> middleMonthKz = [
  "Қаң",
  "Ақп",
  "Нау",
  "Сәу",
  "Мам",
  "Мау",
  "Шіл",
  "Там",
  "Қыр",
  "Қаз",
  "қар",
  "Жел",
];
