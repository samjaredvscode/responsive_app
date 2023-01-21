import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:responsive_app/app/finals/constantes.dart';
import 'package:responsive_app/app/models/models_for_list.dart';
import 'package:responsive_app/app/ui/about_view.dart';
import 'package:responsive_app/app/ui/events_view.dart';
import 'package:responsive_app/app/ui/extension_view.dart';
import 'package:responsive_app/app/ui/information_view.dart';
import 'package:responsive_app/app/ui/intranet_view.dart';
import 'package:responsive_app/app/ui/racing_view.dart';
import 'package:responsive_app/app/utils/button_get_started.dart';

import '../../finals/items_title.dart';
import '../../utils/system_overlay_custom.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemOverlayCustom.overlay(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const CustomDrawer(),
      ),
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
      slidePercent: kSlidePercent,
      curveAnimation: Curves.fastOutSlowIn,
      initPositionSelected: 0,
      menu: const MenuMobil(),
      screenSelectedBuilder: (position, controller) {
        Widget? screenCurrent;
        switch (position) {
          case 0:
            screenCurrent = const MainContentMobil();
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
          backgroundColor: Theme.of(context).colorScheme.background,
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

// class BuildAppBarTitle extends StatelessWidget {
//   const BuildAppBarTitle({
//     super.key,
//     required this.position,
//   });

//   final int position;

//   @override
//   Widget build(BuildContext context) {
//     late String currentText;
//     switch (position) {
//       case 0:
//         currentText = 'Inicio';
//         break;
//       case 1:
//         currentText = 'Eventos';
//         break;
//       case 2:
//         currentText = 'Carreras';
//         break;
//       case 3:
//         currentText = 'Extención';
//         break;
//       case 4:
//         currentText = 'Información';
//         break;
//       case 5:
//         currentText = 'Intranet';
//         break;
//       case 6:
//         currentText = 'Nosotros';
//         break;
//     }
//     return Text(currentText);
//   }
// }

class MenuMobil extends StatefulWidget {
  const MenuMobil({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuMobil> createState() => _MenuMobilState();
}

class _MenuMobilState extends State<MenuMobil> with TickerProviderStateMixin {
  late SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  ModelListTema currentItems = itemOnList.first;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    log('$query');
    return Container(
      constraints: BoxConstraints.expand(
        height: double.maxFinite,
        width: query.width / 1.1 - kSlidePercent,
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
                  currentItem: currentItems.title,
                  valueChanged: (value) {
                    setState(() {
                      currentItems = value;
                    });
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildLisTiled extends StatelessWidget {
  const BuildLisTiled({
    Key? key,
    required this.items,
    required this.controller,
    required this.currentItem,
    required this.valueChanged,
  }) : super(key: key);

  final ModelListTema items;
  final SimpleHiddenDrawerController controller;
  final String currentItem;
  final ValueChanged<ModelListTema> valueChanged;

  @override
  Widget build(BuildContext context) {
    if (items.subtitle.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: ListTile(
          title: Text(items.title),
          leading: Icon(items.icon),
          trailing: Icon(
            items.subtitle.isNotEmpty ? Icons.arrow_forward_ios_rounded : null,
          ),
          onTap: () {
            controller.setSelectedMenuPosition(items.id);
            valueChanged(items);
          },
          selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
          hoverColor: Theme.of(context).colorScheme.onPrimary,
          selectedColor: Theme.of(context).colorScheme.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          selected: currentItem == items.title,
        ),
      );
    }
    return const ListTile();
  }
}

class MainContentMobil extends StatelessWidget {
  const MainContentMobil({super.key});

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
                width: double.infinity,
                height: 320,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/material-3-desing-dark.jpg',
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              presentation.first.title.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                presentation.first.subtitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const ButtonGetStarted(),
                          ],
                        ),
                      ),
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
