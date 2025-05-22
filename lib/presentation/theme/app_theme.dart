import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const Color seedColor = Colors.deepPurple;

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        surface: Colors.deepPurple.shade100,
      ),
    );
  }
}
