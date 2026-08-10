import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color _navy = Color(0xFF0C2340);
  static const Color _gold = Color(0xFFC9A227);

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: _navy,
      brightness: Brightness.light,
      primary: _navy,
      secondary: _gold,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFF7F8FA),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
