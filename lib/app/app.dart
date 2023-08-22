import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_app/app/responsive/devices/bloc/tab_bloc.dart';
import 'package:responsive_app/app/responsive/devices/desktop_layout.dart';
import 'package:responsive_app/app/responsive/devices/mobil_layout.dart';
import 'package:responsive_app/app/responsive/devices/tablet_layout.dart';
import 'package:responsive_app/app/responsive/responsive_layout.dart';
import 'package:responsive_app/app/routes/app_routes.dart';

import 'themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TabBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: CustomRouter.router,
      ),
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
