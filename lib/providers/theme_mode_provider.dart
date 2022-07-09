import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier {
  static ThemeData dark = ThemeData.dark().copyWith();
  static ThemeData light = ThemeData.light().copyWith();

  ThemeMode _selectMode;

  ThemeModeProvider({ThemeMode mode = ThemeMode.system})
      : _selectMode = mode,
        super();

  ThemeMode get currentMode => _selectMode;

  void onChange(ThemeMode? value) {
    if (value == null) return;
    _selectMode = value;
    notifyListeners();
  }
}
