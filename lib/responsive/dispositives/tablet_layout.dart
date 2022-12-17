import 'package:flutter/material.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/utils/my_list_tiled_drawer.dart';

import '../../app/utils/button_get_started.dart';
import '../../app/utils/drawer_header_as.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Icon(Icons.adobe),
      ),
      drawer: const MyDrawerTablet(),
      body: const MainContentTablet(),
    );
  }
}

class MyDrawerTablet extends StatelessWidget {
  const MyDrawerTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
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
              height: 320,
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
                      Text(
                        presentation.first.title,
                        style: const TextStyle(
                          fontSize: 54,
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
    );
  }
}
