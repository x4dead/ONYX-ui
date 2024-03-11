import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onyx_ui/modules/signal_service/news_ref/news_notifer.dart';
import 'package:onyx_ui/modules/signal_service/news_ref/news_state_ref.dart';
import 'package:onyx_ui/modules/signal_service/setting_ref/setting_notifer.dart';
import 'package:onyx_ui/modules/signal_service/setting_ref/setting_state_ref.dart';

///
///Константы для вызова риверпода
///

class River {
  static final settingsPod =
      StateNotifierProvider.autoDispose<SettingsNotifer, SettingsStateRef>(
          (ref) => SettingsNotifer());
  static final newsPod =
      StateNotifierProvider<NewsNotifer, NewsStateRef>((ref) => NewsNotifer());
}
