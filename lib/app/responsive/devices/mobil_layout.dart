import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/utils/my_list_tiled_drawer.dart';

import '../../utils/button_get_started.dart';
import '../../utils/drawer_header_as.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).colorScheme.background),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Icon(Icons.adobe_rounded),
        ),
        drawer: const MyDrawerMobile(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 320,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/material-3-desing-light.jpg',
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  presentation.first.title,
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
                                const ButtonGetStarted(
                                  minimunSize: Size(200, 75),
                                ),
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
        ),
      ),
    );
  }
}

class MyDrawerMobile extends StatelessWidget {
  const MyDrawerMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView(
          children: [
            const DrawerHeaderAS(),
            for (var itemsLista in itemOnList)
              MyListTiledDrawer(
                title: Text(itemsLista.title),
                leading: Icon(itemsLista.icon),
                onTap: () {},
              ),
          ],
        ),
      ),
    );
  }
}
