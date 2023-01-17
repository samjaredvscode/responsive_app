import 'package:flutter/material.dart';

class ThemeCustom {
  static final lighTheme = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF98CBFF),
      onPrimary: Color(0xFF003354),
      primaryContainer: Color(0xFF004A77),
      onPrimaryContainer: Color(0xFFCFE5FF),
      secondary: Color(0xFFB9C8DA),
      onSecondary: Color(0xFF243240),
      secondaryContainer: Color(0xFF3A4857),
      onSecondaryContainer: Color(0xFFD5E4F7),
      tertiary: Color(0xFFD4BEE6),
      onTertiary: Color(0xFF392A49),
      tertiaryContainer: Color(0xFF504061),
      onTertiaryContainer: Color(0xFFEFDBFF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF1A1C1E),
      onBackground: Color(0xFFE2E2E5),
      surface: Color(0xFF1A1C1E),
      onSurface: Color(0xFFE2E2E5),
      surfaceVariant: Color(0xFF42474E),
      onSurfaceVariant: Color(0xFFC2C7CF),
      outline: Color(0xFF8C9199),
      onInverseSurface: Color(0xFF1A1C1E),
      inverseSurface: Color(0xFFE2E2E5),
      inversePrimary: Color(0xFF00639C),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF98CBFF),
    ),
  );
}
