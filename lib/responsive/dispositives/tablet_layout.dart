import 'package:flutter/material.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/utils/my_list_tiled_drawer.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

int currentIndex = 0;

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Icon(Icons.adobe),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeaderAS(),
            for (var itemsLista in temaList)
              MyListTiledDrawer(
                title: Text(itemsLista.title),
                leading: itemsLista.icon,
                onTap: () {},
              ),
          ],
        ),
      ),
      body: const MainContentTablet(),
    );
  }
}

class MainContentTablet extends StatelessWidget {
  const MainContentTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/material-3-desing-light.jpg',
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'American System',
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Instituto de Educación Superior Tecnológico Privado I.E.S.T.P',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.background,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            minimumSize: const Size(190, 80),
                          ),
                          child: const Text(
                            'Empezar',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerHeaderAS extends StatelessWidget {
  const DrawerHeaderAS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onInverseSurface,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 10,
            ),
            child: Text(
              'American System',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
