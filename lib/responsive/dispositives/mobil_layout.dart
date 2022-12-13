import 'package:flutter/material.dart';

import '../../app/utils/ramdon_containers.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

int currentValue = 0;

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        4,
        (index) => RamdonContainers(
              index: index,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ));

    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          iconTheme: MaterialStatePropertyAll(
            IconThemeData(size: 28),
          ),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: currentValue,
          elevation: 1,
          animationDuration: const Duration(milliseconds: 1000),
          onDestinationSelected: (valueIndex) {
            setState(() {
              currentValue = valueIndex;
            });
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home_rounded,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_outline),
              selectedIcon: Icon(
                Icons.person_rounded,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              label: 'Person',
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_border),
              selectedIcon: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: Icon(
                Icons.settings_rounded,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),

      // el cuerpo de la página

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('American System'),
            pinned: true,
            elevation: 0,
            actions: [
              IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: items,
          ),
          // const SliverAppBar(title: Text('Sliver List')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return RamdonContainers(
                  index: index,
                  colorText: Theme.of(context).colorScheme.onBackground,
                  height: 80,
                  color: Colors.amber,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
