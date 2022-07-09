import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dark_mode/providers/theme_mode_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModeProvider>(context); // PROVIDER

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themeProvider.currentMode,
            onChanged: themeProvider.onChange,
          ),
          RadioListTile(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeProvider.currentMode,
            onChanged: themeProvider.onChange,
          ),
          RadioListTile(
            title: const Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeProvider.currentMode,
            onChanged: themeProvider.onChange,
          ),
        ],
      ),
    );
  }
}
