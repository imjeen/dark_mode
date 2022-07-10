import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dark_mode/providers/theme_mode_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModeProvider>(context); // PROVIDER

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: AnimatedCrossFade(
              crossFadeState: Theme.of(context).brightness == Brightness.light
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Image.asset('assets/sun.png', width: 200),
              secondChild: Image.asset('assets/moon.png', width: 200),
              duration: const Duration(milliseconds: 200),
            ),
          ),
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
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/fest');
            },
            child: const Text('Go fest'),
          ),
        ],
      ),
    );
  }
}
