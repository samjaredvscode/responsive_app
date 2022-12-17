import 'package:flutter/material.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/utils/my_list_tiled_drawer.dart';
import 'package:responsive_app/responsive/dispositives/tablet_layout.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Icon(Icons.adobe_rounded),
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
    );
  }
}
