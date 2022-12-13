import 'package:flutter/material.dart';
import 'package:responsive_app/app/utils/my_box.dart';

import '../../app/utils/my_list_tiled_drawer.dart';

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
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Buen día, Sam!',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      drawer: Drawer(
        width: 250,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              duration: const Duration(milliseconds: 1000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.blur_on_rounded),
                  Text(
                    'A M E R I C A N\n   S Y S T E M',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            MyListTiledDrawer(
              leading: const Icon(
                Icons.home_rounded,
              ),
              title: const Text('Home'),
              onTap: () {},
            ),
            MyListTiledDrawer(
              leading: const Icon(
                Icons.person_rounded,
              ),
              title: const Text('Person'),
              onTap: () {},
            ),
            MyListTiledDrawer(
              leading: const Icon(
                Icons.favorite_rounded,
              ),
              title: const Text('Favorite'),
              onTap: () {},
            ),
            MyListTiledDrawer(
              leading: const Icon(
                Icons.settings_rounded,
              ),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return MyCustomBox(
            color: Theme.of(context).colorScheme.onSecondary,
            child: Text(
              '$index',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
