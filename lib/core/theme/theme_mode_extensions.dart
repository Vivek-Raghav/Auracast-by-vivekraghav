// Flutter imports:
import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  Brightness get currentBrightness => Theme.of(this).brightness;
  ThemeMode get inferredThemeMode {
    final platformBrightness = MediaQuery.platformBrightnessOf(this);
    final themeBrightness = Theme.of(this).brightness;

    if (themeBrightness == platformBrightness) {
      return ThemeMode.system;
    }

    return themeBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
