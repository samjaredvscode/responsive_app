import 'package:flutter/material.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/utils/button_get_started.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavigatinRailWidget(),
    );
  }
}

class NavigatinRailWidget extends StatefulWidget {
  const NavigatinRailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigatinRailWidget> createState() => _NavigatinRailWidgetState();
}

int currentIndex = 0;

class _NavigatinRailWidgetState extends State<NavigatinRailWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavigationRailTheme(
          data: const NavigationRailThemeData(
            labelType: NavigationRailLabelType.all,
          ),
          child: NavigationRail(
            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            minWidth: 100,
            destinations: [
              NavigationRailDestination(
                icon: Icon(itemOnList.first.icon),
                label: Text(itemOnList.first.title),
              ),
            ],
            useIndicator: true,
            selectedIndex: currentIndex,
            onDestinationSelected: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
        const MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: SizedBox(
                width: double.infinity,
                height: 420,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/material-3-desing-light.jpg',
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
          presentation.first.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w600,
            fontSize: 64,
          ),
        ),
        Text(
          presentation.first.subtitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 22,
          ),
        ),
        const ButtonGetStarted()
      ],
    );
  }
}
