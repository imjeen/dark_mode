import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dark_mode/providers/theme_mode_provider.dart';
import 'package:dark_mode/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeProvider>(
      builder: (context, themeProvider, child) {
        return _buildApp(
          themeMode: themeProvider.currentMode,
        );
      },
    );
  }

  Widget _buildApp({required ThemeMode themeMode}) {
    return MaterialApp(
      title: 'Dark Mode Demo',
      themeMode: themeMode,
      theme: ThemeModeProvider.light,
      darkTheme: ThemeModeProvider.dark,
      home: const HomeScreen(),
    );
  }
}
