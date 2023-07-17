import 'dart:collection';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/routes/list_pages.dart';
import 'package:responsive_app/app/utils/header_drawer.dart';
import 'package:responsive_app/app/utils/navigation_drawer_custom.dart';

import '../../utils/button_get_started.dart';
import 'bloc/tab_bloc.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = context.select<TabBloc, int>((value) => value.state.index);
    final updateMap = HashMap<int, Widget>.from({
      ...ListPage.currentPages,
      0: const MainContentTablet(),
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('T A B L E T'),
      ),
      drawer: const MyDrawerTablet(),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: updateMap[screens],
      ),
    );
  }
}

class MyDrawerTablet extends StatelessWidget {
  const MyDrawerTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return NavigationDrawerCustom(
          selectedIndex: state.index,
          onDestinationSelected: (value) {
            context
                .read<TabBloc>()
                .add(TabEvent.currentIndex(currentIndex: value));
            context.pop();
          },
          children: [
            const HeaderDrawer(),
            ...itemOnList.map(
              (items) => NavigationDrawerDestinationCustom(
                icon: Icon(items.icon),
                label: Text(items.title),
              ),
            )
          ],
        );
      },
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
