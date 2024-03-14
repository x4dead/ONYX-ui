import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onyx_ui/utils/constants/ui_constants.dart';
import 'package:onyx_ui/utils/extensions/context_localization.dart';
import 'package:onyx_ui/utils/user_pref.dart';

class Converting {
  static String getNewsDate(DateTime postDate, BuildContext context) {
    final now = DateTime.now();

    final difference = now.difference(postDate);
    String date = '';
    final today = postDate.month == now.month &&
        postDate.day == now.day &&
        postDate.year == now.year;
    final localization = context.localization;
    if (difference.inDays >= 1 &&
        difference.inDays != 7 &&
        postDate.month == now.month) {
      date = ('${difference.inDays} ${localization.day}');
    } else if (difference.inDays == 7) {
      date = (localization.week_ago);
    } else if (difference.inDays == 14) {
      date = (localization.weeks2_ago);
    } else if (postDate.month == now.month &&
        now.year == postDate.year &&
        !today) {
      final month = UserPref.getLocale == "ru"
          ? middleMonthRu[postDate.month - 1]
          : middleMonthKz[postDate.month - 1];
      date = "${postDate.day} ${month.toLowerCase()} ";
    } else if (now.year > postDate.year) {
      final month = UserPref.getLocale == "ru"
          ? middleMonthRu[postDate.month - 1]
          : middleMonthKz[postDate.month - 1];
      date = "${month.toLowerCase()} ${postDate.day}, ${postDate.year}";
    } else if (difference.inHours >= 1 && today) {
      date = ('${difference.inHours} ${localization.hour}');
    } else if (difference.inMinutes >= 1 && today) {
      date = ('${difference.inMinutes} ${localization.minute}');
    } else {
      date = (localization.now);
    }
    return date;
  }

  static String getPaymentDateDMY(DateTime paymentDate,
      {bool? shortYear = false}) {
    final DateFormat formatter = DateFormat(
        shortYear == true ? "dd.MM.yy" : "dd.MM.yyyy", UserPref.getLocale);
    return formatter.format(paymentDate);
  }

  static String getTime(DateTime paymentDate) {
    final DateFormat formatter = DateFormat("HH:MM", UserPref.getLocale);
    return formatter.format(paymentDate);
  }

  static String getPaymentDate(DateTime paymentDate, BuildContext ctx) {
    final now = DateTime.now();

    final difference = paymentDate.difference(now);
    String date = '';
    final today = paymentDate.month == now.month &&
        paymentDate.day == now.day &&
        paymentDate.year == now.year;
    final tomorrow = now.day < paymentDate.day;
    final localization = ctx.localization;
    final month = UserPref.getLocale == "ru"
        ? middleMonthRu[paymentDate.month - 1]
        : middleMonthKz[paymentDate.month - 1];
    final DateFormat formatter = DateFormat("dd.MM.yyyy", UserPref.getLocale);
    //
    if (now.year == paymentDate.year &&
        !today &&
        !difference.inDays.isNegative &&
        !tomorrow) {
      ///Отображаем день и месяц если разница в днях положительна

      date = "${paymentDate.day} ${month.toLowerCase()} ";
    } else if (now.year == paymentDate.year &&
        difference.inDays.isNegative &&
        difference.inDays != -1) {
      ///Отображаем день и месяц если разница в днях отрицательна

      date = "${paymentDate.day} ${month.toLowerCase()} ";
    } else if (now.year != paymentDate.year) {
      ///Отображаем месяц, день и год

      date = formatter.format(paymentDate);
    } else if (tomorrow) {
      ///Отображаем "Завтра"
      date = localization.tomorrow;
    } else if (today == true) {
      ///Отображаем "Сегодня"
      date = localization.today;
    } else if (difference.inDays == -1) {
      ///Отображаем "Вчера"
      date = (localization.yesterday);
    }
    return date;
  }

  static String getShortUserName(
      {(String, String)? firstAndLastName, String? fullName}) {
    if (fullName != null && firstAndLastName == null) {
      final List<String> names = fullName.split(' ');
      if (names.length > 1) {
        return '${names[0].characters.first}${names[1].characters.first}';
      } else {
        return names.first.characters.first;
      }
    } else {
      return '${firstAndLastName!.$1.characters.first}${firstAndLastName.$2.characters.first}'
          .toUpperCase();
    }
  }

  static String formatPhoneNumber(String rawPhoneNumber) {
    String cleanedPhoneNumber = rawPhoneNumber.replaceAll(RegExp(r'\D'), '');

    if (cleanedPhoneNumber.length == 10) {
      cleanedPhoneNumber = '7$cleanedPhoneNumber';
    }

    return '+${cleanedPhoneNumber.substring(0, 1)} '
        '(${cleanedPhoneNumber.substring(1, 4)}) '
        '${cleanedPhoneNumber.substring(4, 7)}-'
        '${cleanedPhoneNumber.substring(7, 9)}-'
        '${cleanedPhoneNumber.substring(9, 11)}';
  }

  static String formatNumber(String input) {
    // Удаляем все запятые из строки (если они есть)
    String cleanedInput = input.replaceAll(",", "");

    // Преобразуем строку в число
    int number = int.tryParse(cleanedInput) ?? 0;

    // Форматируем число с пробелами между группами цифр
    String formattedNumber = number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]} ',
        );

    return formattedNumber;
  }

  // static String getUserLastActive(String updateDate) {
  //   final updatedDate = DateTime.parse(updateDate);
  //   final now = DateTime.now();
  //   final today = now.day;
  //   final yesterday = now.subtract(const Duration(days: 1)).day;
  //   final buffer = StringBuffer();
  //   final time =
  //       ' ${updatedDate.hour < 10 ? "0${updatedDate.hour}" : updatedDate.hour}:${updatedDate.minute < 10 ? "0${updatedDate.minute}" : updatedDate.minute}';

  //   if (updatedDate.day == today &&
  //       updatedDate.month == now.month &&
  //       updatedDate.year == now.year) {
  //     buffer.write('сегодня в $time');
  //   } else if (updatedDate.day == yesterday &&
  //       updatedDate.month == now.month &&
  //       updatedDate.year == now.year) {
  //     buffer.write('вчера в $time');
  //   } else {
  //     final dateFormat = DateFormat(
  //       'dd.MM.yy',
  //     );
  //     buffer.write("${dateFormat.format(updatedDate)} в $time");
  //   }
  //   return "был(-а) $buffer";
  // }

  // static String getUpdateDate(String updateDate,
  //     {bool? isChatDateTime = false}) {
  //   final updatedDate = DateTime.parse(updateDate);
  //   final now = DateTime.now();
  //   final today = now.day;
  //   final yesterday = now.subtract(const Duration(days: 1)).day;
  //   final buffer = StringBuffer();
  //   final dateDiff = now.difference(updatedDate);

  //   if (updatedDate.day == today &&
  //       updatedDate.month == now.month &&
  //       updatedDate.year == now.year &&
  //       (dateDiff.inMinutes < 60 &&
  //           !dateDiff.inMinutes.isNegative &&
  //           isChatDateTime == false)) {
  //     buffer.write(dateDiff.inMinutes < 1
  //         ? "только что"
  //         : " ${dateDiff.inMinutes} минут назад");
  //   } else if (updatedDate.day == today &&
  //       updatedDate.month == now.month &&
  //       updatedDate.year == now.year &&
  //       isChatDateTime == false) {
  //     buffer.write(
  //         '${updatedDate.hour < 10 ? "0${updatedDate.hour}" : updatedDate.hour}:${updatedDate.minute < 10 ? "0${updatedDate.minute}" : updatedDate.minute}');
  //   } else if (updatedDate.day == yesterday &&
  //       updatedDate.month == now.month &&
  //       updatedDate.year == now.year) {
  //     buffer.write('Вчера');
  //   } else if (updatedDate.day == now.day &&
  //       updatedDate.month == now.month &&
  //       updatedDate.year == now.year &&
  //       isChatDateTime == true) {
  //     buffer.write('Сегодня');
  //   } else if (dateDiff.inDays.abs() <= 6 &&
  //       (!dateDiff.inDays.isNegative && dateDiff.inDays.abs() != 0)) {
  //     final dayOfWeek = DateFormat.E().format(updatedDate);
  //     buffer.write(switch (dayOfWeek.toLowerCase()) {
  //       'mon' => 'Понидельник',
  //       'tue' => 'Вторник',
  //       'wed' => 'Среда',
  //       'thu' => 'Четверг',
  //       'fri' => 'Пятница',
  //       'sat' => 'Суббота',
  //       'sun' => 'Воскресенье',
  //       _ => 'none'
  //     });
  //   } else if (updatedDate.year == now.year && isChatDateTime == false) {
  //     buffer.write('${updatedDate.day} ${middleMonth[updatedDate.month - 1]}');
  //   } else {
  //     final dateFormat = DateFormat(
  //       'dd.MM.yy',
  //     );
  //     buffer.write(dateFormat.format(updatedDate));
  //   }
  //   return buffer.toString();
  // }
}
