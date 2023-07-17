import 'package:flutter/widgets.dart';
import 'package:responsive_app/app/responsive/devices/mobil_layout.dart';
import 'package:responsive_app/app/ui/pages/about_view.dart';
import 'package:responsive_app/app/ui/pages/events_view.dart';
import 'package:responsive_app/app/ui/pages/extension_view.dart';
import 'package:responsive_app/app/ui/pages/information_view.dart';
import 'package:responsive_app/app/ui/pages/racing_view.dart';

class ListPage {
  static final Map<int, Widget> currentPages = {
    0: const MainContentMobil(),
    1: const EventsView(),
    2: const RacingView(),
    3: const ExtensionView(),
    4: const InformationView(),
    5: const AboutView(),
  };
}
