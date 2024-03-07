class SettingsStateRef {
  final String? locale;

  SettingsStateRef({
    this.locale,
  });

  SettingsStateRef copyWith({
    String? locale,
    bool? isLight,
  }) {
    return SettingsStateRef(
      locale: locale ?? this.locale,
    );
  }
}
