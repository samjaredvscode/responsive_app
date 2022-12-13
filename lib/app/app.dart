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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
      ),
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
