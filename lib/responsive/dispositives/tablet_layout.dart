import 'package:flutter/material.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

int currentIndex = 0;

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Row(
          children: [
            NavigationRail(
              selectedIconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.primary,
              ),
              unselectedIconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              indicatorColor: Theme.of(context).colorScheme.onTertiaryContainer,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(
                    Icons.home_rounded,
                  ),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(
                    Icons.person_rounded,
                  ),
                  label: Text('Person'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(
                    Icons.favorite,
                  ),
                  label: Text('Favorite'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(
                    Icons.settings_rounded,
                  ),
                  label: Text('Settings'),
                ),
              ],
              selectedIndex: currentIndex,
              onDestinationSelected: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
