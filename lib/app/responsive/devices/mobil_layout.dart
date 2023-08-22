import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/models/models_for_list.dart';
import 'package:responsive_app/app/responsive/devices/bloc/tab_bloc.dart';
import 'package:responsive_app/app/routes/list_pages.dart';
import 'package:responsive_app/app/utils/utils.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = context.select<TabBloc, int>((value) => value.state.index);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayUser(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Icon(Icons.adobe_rounded),
          actions: [
            PopupMenuButton<MenuItem>(
              position: PopupMenuPosition.under,
              onSelected: (value) => onSelectec(context, value),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
              ),
              itemBuilder: (context) => [
                ...MenuItems.itemsFirst.map(buildItem).toList(),
                const PopupMenuDivider(),
                ...MenuItems.itemsSeconds.map(buildItem).toList(),
              ],
            )
          ],
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: ListPage.currentPages[screen],
        ),
        drawer: const MyDrawerMobil(),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) {
    return PopupMenuItem<MenuItem>(
      value: item,
      child: Row(
        children: [
          Icon(item.icon),
          const SizedBox(width: 5),
          Text(item.title),
        ],
      ),
    );
  }

  void onSelectec(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemAdministrativo:
        GoRouter.of(context).pushNamed('admin');
        break;
      case MenuItems.itemAlumnos:
        GoRouter.of(context).pushNamed('student');
        break;
      case MenuItems.itemsDocente:
        GoRouter.of(context).pushNamed('teacher');
        break;
    }
  }
}

class MyDrawerMobil extends StatelessWidget {
  const MyDrawerMobil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return NavigationDrawerCustom(
          selectedIndex: state.index,
          onDestinationSelected: (value) {
            var event = TabEvent.currentIndex(currentIndex: value);
            context.read<TabBloc>().add(event);
            context.pop();
          },
          children: [
            const HeaderDrawer(),
            ...itemOnList.map(
              (items) => NavigationDrawerDestinationCustom(
                icon: Icon(items.icon),
                selectedIcon: Icon(
                  items.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(items.title),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MainContentMobil extends StatelessWidget {
  const MainContentMobil({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    log('width -> $sizeWidth');
    log('height -> $sizeHeight');
    final textSize = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: colorScheme.background,
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
                    AssetSwitch(brightness),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              presentation.first.title.toUpperCase(),
                              style: TextStyle(
                                fontSize: textSize.displayMedium!.fontSize,
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
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Carreras Profesionales',
              style: TextStyle(
                fontSize: textSize.displaySmall!.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// CareersProfessionalWidget(sizeWidth: sizeWidth),
          ///
          ///
          /// Carreas Profesionales Container

          const AboutCrearsWidget(
            title: 'Administración de Redes y Comunicaciones',
            subTitle:
                'El proceso de administración de una red de los fallos y el rendimiento utilizando diversas herramientas y tecnologías.',
            assetImage: 'assets/images/administración-de-redes-1.jpg',
          ),
          const AboutCrearsWidget(
            title: 'Administración de Empresas',
            subTitle:
                'La administración de empresas es una rama de las ciencias sociales que tiene como objetivo principal tomar los recursos de forma estratégica para lograr los objetivos.',
            assetImage: 'assets/images/administrador-estadistica.jpg',
          ),
          const AboutCrearsWidget(
            title: 'Secretariado Ejecutivo',
            subTitle:
                'El secretariado ejecutivo es un puesto de trabajo o profesión que sirve para brindar el máximo apoyo a los empleados de alto rango en una empresa u organización.',
            assetImage: 'assets/images/secretarido-ejecutivo.jpg',
          ),
        ],
      ),
    );
  }
}

class AboutCrearsWidget extends StatelessWidget {
  const AboutCrearsWidget({
    required this.title,
    required this.subTitle,
    required this.assetImage,
    super.key,
  });

  final String title;
  final String subTitle;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textSize = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.elliptical(20, 20),
              ),
              child: Image.asset(assetImage, fit: BoxFit.cover),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 350, minHeight: 90),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text.rich(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$title\n',
                      style: TextStyle(
                        fontSize: textSize.titleMedium?.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: subTitle,
                    )
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

class CareersProfessionalWidget extends StatelessWidget {
  const CareersProfessionalWidget({
    super.key,
    required this.sizeWidth,
  });

  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textSize = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            height: 320,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(
                Radius.elliptical(20, 20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 2.25,
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(20, 20),
                  bottomRight: Radius.elliptical(20, 20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Administración de Redes y Comunicaciones\n',
                        style: TextStyle(
                          fontSize: textSize.titleMedium!.fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text:
                            'El proceso de administración de una red de los fallos y el rendimiento utilizando diversas herramientas y tecnologías.',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: sizeWidth,
            constraints: const BoxConstraints.expand(height: 200),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.elliptical(20, 20),
              ),
              child: Image.asset(
                'assets/images/material-3-desing-light.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AssetSwitch extends StatelessWidget {
  const AssetSwitch(
    this.brightness, {
    super.key,
  });

  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      brightness == Brightness.dark
          ? 'assets/images/material-3-desing-dark.jpg'
          : 'assets/images/material-3-desing-light.jpg',
      fit: BoxFit.cover,
    );
  }
}
