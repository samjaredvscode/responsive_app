import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:responsive_app/app/finals/constantes.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/models/models_for_list.dart';
import 'package:responsive_app/app/ui/about_view.dart';
import 'package:responsive_app/app/ui/events_view.dart';
import 'package:responsive_app/app/ui/extension_view.dart';
import 'package:responsive_app/app/ui/information_view.dart';
import 'package:responsive_app/app/ui/intranet_view.dart';
import 'package:responsive_app/app/ui/racing_view.dart';

import '../../utils/button_get_started.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const CustomDrawer(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      contentCornerRadius: 30,
      verticalScalePercent: 90,
      slidePercent: kSlidePercent / 2,
      curveAnimation: Curves.fastOutSlowIn,
      initPositionSelected: 0,
      menu: const MenuTablet(),
      screenSelectedBuilder: (position, controller) {
        Widget? screenCurrent;
        switch (position) {
          case 0:
            screenCurrent = const MainContentTablet();
            break;
          case 1:
            screenCurrent = const EventsView();
            break;
          case 2:
            screenCurrent = const RacingView();
            break;
          case 3:
            screenCurrent = const ExtensionView();
            break;
          case 4:
            screenCurrent = const InformationView();
            break;
          case 5:
            screenCurrent = const IntranetView();
            break;
          case 6:
            screenCurrent = const AboutView();
            break;
        }
        return Scaffold(
          appBar: AppBar(
            title: const Icon(Icons.adobe_rounded),
            leading: IconButton(
              onPressed: () {
                controller.toggle();
              },
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
              ),
            ),
          ),
          body: screenCurrent,
        );
      },
    );
  }
}

class MenuTablet extends StatefulWidget {
  const MenuTablet({super.key});

  @override
  State<MenuTablet> createState() => _MenuTabletState();
}

class _MenuTabletState extends State<MenuTablet> {
  late SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    log('$query');
    log('${query.height / query.width}');
    return Container(
      constraints: BoxConstraints.expand(
        height: double.infinity,
        width: query.width / 2.2 - kSlidePercent,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var items in itemOnList)
                BuildLisTiled(
                  items: items,
                  controller: controller,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildLisTiled extends StatelessWidget {
  const BuildLisTiled({
    super.key,
    required this.items,
    required this.controller,
  });

  final ModelListTema items;
  final SimpleHiddenDrawerController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (items.subtitle.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: ListTile(
          title: Text(items.title),
          leading: Icon(items.icon),
          hoverColor: colorScheme.inversePrimary,
          selectedColor: colorScheme.onBackground,
          selectedTileColor: colorScheme.primaryContainer,
          minLeadingWidth: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: () {
            controller.setSelectedMenuPosition(items.id);
          },
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ListTile(
        title: Text(items.title),
        leading: Icon(items.icon),
        minLeadingWidth: 10,
        trailing: const Icon(Icons.arrow_forward_rounded),
        hoverColor: colorScheme.inversePrimary,
        selectedColor: colorScheme.onBackground,
        selectedTileColor: colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {
          controller.setSelectedMenuPosition(items.id);
        },
      ),
    );
  }
}

class MainContentTablet extends StatelessWidget {
  const MainContentTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 320,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/material-3-desing-dark.jpg',
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          presentation.first.title.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            presentation.first.subtitle,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const ButtonGetStarted(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
