import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onyx_ui/utils/user_pref.dart';

import 'setting_state_ref.dart';

class SettingsNotifer extends StateNotifier<SettingsStateRef> {
  SettingsNotifer()
      : super(SettingsStateRef(
          locale: UserPref.getLocale,
        ));

  void setLocale(Locale? locale) =>
      state = state.copyWith(locale: UserPref.setLocale = locale!.languageCode);
}
