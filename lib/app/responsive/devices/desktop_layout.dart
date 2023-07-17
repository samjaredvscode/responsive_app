import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/routes/list_pages.dart';
import 'package:responsive_app/app/utils/button_get_started.dart';

import 'bloc/tab_bloc.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = context.select<TabBloc, int>((value) => value.state.index);
    Map<int, Widget> updateMap = {
      ...ListPage.currentPages,
      0: const MainContentDesktop(),
    };
    return Scaffold(
      bottomNavigationBar: NavigatinRailWidget(
        screens: updateMap[screens],
      ),
    );
  }
}

class NavigatinRailWidget extends StatelessWidget {
  const NavigatinRailWidget({
    super.key,
    this.screens,
  });

  final Widget? screens;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavigationRailTheme(
          data: const NavigationRailThemeData(
            labelType: NavigationRailLabelType.all,
          ),
          child: BlocBuilder<TabBloc, TabState>(
            builder: (context, state) {
              return NavigationRail(
                backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                minWidth: 100,
                destinations: [
                  ...itemOnList.map(
                    (items) => NavigationRailDestination(
                      icon: Icon(items.icon),
                      label: Text(items.title),
                    ),
                  )
                ],
                useIndicator: true,
                selectedIndex: state.index,
                onDestinationSelected: (value) {
                  context
                      .read<TabBloc>()
                      .add(TabEvent.currentIndex(currentIndex: value));
                },
              );
            },
          ),
        ),
        screens!
      ],
    );
  }
}

class MainContentDesktop extends StatelessWidget {
  const MainContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: double.infinity,
                height: 420,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/material-3-desing-dark.jpg',
                      fit: BoxFit.cover,
                    ),
                    const PresentationOne()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenidos a nuestro sitio Web.',
              style: TextStyle(
                fontSize: 54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PresentationOne extends StatelessWidget {
  const PresentationOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          presentation.first.title.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w600,
            fontSize: 86,
          ),
        ),
        Text(
          presentation.first.subtitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        const ButtonGetStarted()
      ],
    );
  }
}
