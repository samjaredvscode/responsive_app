import 'package:flutter/material.dart';
import 'package:responsive_app/responsive/dispositives/desktop_layout.dart';
import 'package:responsive_app/responsive/dispositives/mobil_layout.dart';
import 'package:responsive_app/responsive/dispositives/tablet_layout.dart';
import 'package:responsive_app/responsive/responsive_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF785900),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFFFDF9E),
        onPrimaryContainer: Color(0xFF261A00),
        secondary: Color(0xFF6B5D3F),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFF5E0BB),
        onSecondaryContainer: Color(0xFF241A04),
        tertiary: Color(0xFF4A6547),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFCCEBC4),
        onTertiaryContainer: Color(0xFF072109),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFFFBFF),
        onBackground: Color(0xFF1E1B16),
        surface: Color(0xFFFFFBFF),
        onSurface: Color(0xFF1E1B16),
        surfaceVariant: Color(0xFFEDE1CF),
        onSurfaceVariant: Color(0xFF4D4639),
        outline: Color(0xFF7F7667),
        onInverseSurface: Color(0xFFF7EFE7),
        inverseSurface: Color(0xFF33302A),
        inversePrimary: Color(0xFFFABD00),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF785900),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobilScaffold: MobileLayout(),
      tabletScaffold: TabletLayout(),
      desktopScaffold: DesktopLayout(),
    );
  }
}
