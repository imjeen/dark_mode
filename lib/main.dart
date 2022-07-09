import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dark_mode/App.dart';
import 'package:dark_mode/providers/theme_mode_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeModeProvider>(
    create: (BuildContext context) {
      return ThemeModeProvider();
    },
    child: const App(),
  ));
}
