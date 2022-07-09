import 'package:flutter/material.dart';

class ThemeModeProvider extends ChangeNotifier {
  static ThemeData light = _buildLightTheme(); // ThemeData.dark().copyWith();
  static ThemeData dark = _buildDarkTheme(); // ThemeData.light().copyWith();

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

ThemeData _buildLightTheme() {
  return ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      secondary: Colors.black,
      brightness: Brightness.light,
    ),
    iconTheme:
        const IconThemeData(color: Colors.black87, size: 15.0, opacity: 10),
  );
}

ThemeData _buildDarkTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    visualDensity: const VisualDensity(horizontal: 2.0, vertical: 2.0),
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      secondary: Colors.white,
      brightness: Brightness.dark,
    ),
    iconTheme:
        const IconThemeData(color: Colors.white, size: 15.0, opacity: 10),
  );
}
