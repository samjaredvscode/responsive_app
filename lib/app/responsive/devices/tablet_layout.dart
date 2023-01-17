import 'package:flutter/material.dart';
import 'package:responsive_app/app/finals/items_title.dart';
import 'package:responsive_app/app/utils/drawer_header_as.dart';

import '../../utils/button_get_started.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Icon(Icons.adobe_rounded),
      ),
      drawer: const MyDrawerTablet(),
      body: const MainContentTablet(),
    );
  }
}

class MainContentTablet extends StatelessWidget {
  const MainContentTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 320,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/material-3-desing-dark.jpg',
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        presentation.first.title.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 50,
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

class MyDrawerTablet extends StatefulWidget {
  const MyDrawerTablet({super.key});

  @override
  State<MyDrawerTablet> createState() => _MyDrawerTabletState();
}

class _MyDrawerTabletState extends State<MyDrawerTablet> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 35),
        child: Column(
          children: [
            const DrawerHeaderAS(),
            Expanded(
              child: ListView.builder(
                itemCount: itemOnList.length,
                itemBuilder: (context, index) {
                  final result = itemOnList[index].subtitle;
                  if (result.isEmpty) {
                    return ListTile(
                      title: Text(itemOnList[index].title),
                      leading: Icon(itemOnList[index].icon),
                      iconColor: Colors.white60,
                      onTap: () {},
                    );
                  }
                  return ExpansionTile(
                    maintainState: true,
                    title: Text(itemOnList[index].title),
                    leading: Icon(itemOnList[index].icon),
                    children: [
                      for (var item in result)
                        ListTile(
                          contentPadding: const EdgeInsets.only(left: 30),
                          title: Text(item),
                          leading: const Icon(Icons.adjust_rounded),
                          onTap: () {},
                        )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
