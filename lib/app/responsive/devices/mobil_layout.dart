import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_app/app/finals/items_title.dart';

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
        body: const MainContentMobil(),
      ),
    );
  }
}

class MainContentMobil extends StatelessWidget {
  const MainContentMobil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: double.infinity,
                height: 320,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/material-3-desing-dark.jpg',
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              presentation.first.title.toUpperCase(),
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
                            const ButtonGetStarted(),
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
