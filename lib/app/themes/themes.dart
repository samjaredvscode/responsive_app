import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      colorSchemeSeed: Colors.tealAccent,
      useMaterial3: true,
      fontFamily: 'Poppins',
      appBarTheme: const AppBarTheme(
        elevation: 10,
      ),
    );
  }
}
