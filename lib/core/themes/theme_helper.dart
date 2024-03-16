import 'package:flutter/material.dart';

class ThemeHelper {
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF202326),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF01F0FF),
      secondary: Color(0xFF4441ED),
      primaryContainer : Color(0xFF48484A)
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF202326),
      surfaceTintColor: Colors.transparent
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white)
    )
  );
}
