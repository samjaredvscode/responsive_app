import 'package:flutter/material.dart';
import 'package:responsive_app/app/finals/items_title.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

int currentIndex = 0;

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRailTheme(
            data: const NavigationRailThemeData(
              labelType: NavigationRailLabelType.all,
            ),
            child: ClipRRect(
              child: Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    NavigationRail(
                      backgroundColor:
                          Theme.of(context).colorScheme.onInverseSurface,
                      minWidth: 100,
                      destinations: [
                        for (var itemsLista in temaList)
                          NavigationRailDestination(
                            icon: itemsLista.icon,
                            label: Text(itemsLista.title),
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
                  ],
                ),
              ),
            ),
          ),
          const MainContent()
        ],
      ),
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: SizedBox(
                width: double.infinity,
                height: 400,
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
          ],
        ),
      ),
    );
  }
}

class PresentationOne extends StatelessWidget {
  const PresentationOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'American System',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w600,
            fontSize: 64,
          ),
        ),
        Text(
          'Instituto de Educación Superior Tecnológico Privado I.E.S.T.P',
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

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          minimumSize: const Size(220, 90),
        ),
        child: const Text(
          'Empezar',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
