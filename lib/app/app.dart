import 'package:flutter/material.dart';
import 'package:responsive_app/app/responsive/devices/desktop_layout.dart';
import 'package:responsive_app/app/responsive/devices/mobil_layout.dart';
import 'package:responsive_app/app/responsive/devices/tablet_layout.dart';
import 'package:responsive_app/app/responsive/responsive_layout.dart';
import 'package:responsive_app/app/routes/app_routes.dart';
import 'package:responsive_app/app/themes/themes_custom.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeCustom.lighTheme,
      routerConfig: CustomRouter.router,
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
