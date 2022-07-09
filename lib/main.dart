import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dark_mode/App.dart';
import 'package:dark_mode/providers/theme_mode_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeMode = await ThemeModeProvider.getDefaultThemeMode();

  runApp(ChangeNotifierProvider<ThemeModeProvider>(
    create: (BuildContext context) {
      return ThemeModeProvider(mode: themeMode);
    },
    child: const App(),
  ));
}
