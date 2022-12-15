import 'package:flutter/material.dart';
import 'package:responsive_app/app/models/models_for_list.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      // app bar con thema integrado

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      bottomNavigationBar: const BottonNavigartionBarOnCover(),

      // el cuerpo de la página

      body: ListView(
        children: const [
          TitleCover(),
          PlantCover(),
          CardItems(),
          Title(
            title: 'Care',
          ),
          CareCover(),
          Title(
            title: 'About',
          ),
        ],
      ),
    );
  }
}

class CareCover extends StatelessWidget {
  const CareCover({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ModelsListCover> careCoverItems = [
      ModelsListCover(
        id: 1,
        leading: 'Water every Tuesday',
        icon: const Icon(Icons.water_rounded),
      ),
      ModelsListCover(
        id: 2,
        leading: 'Food once monthley',
        icon: const Icon(Icons.pedal_bike),
      ),
    ];

    return Column(
      children: [
        for (var careCover in careCoverItems)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            child: Row(
              children: [
                careCover.icon,
                const SizedBox(width: 20),
                Text(careCover.leading),
              ],
            ),
          )
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '$title',
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class BottonNavigartionBarOnCover extends StatefulWidget {
  const BottonNavigartionBarOnCover({
    Key? key,
  }) : super(key: key);

  @override
  State<BottonNavigartionBarOnCover> createState() =>
      _BottonNavigartionBarOnCoverState();
}

int currentValue = 0;

class _BottonNavigartionBarOnCoverState
    extends State<BottonNavigartionBarOnCover> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        iconTheme: MaterialStatePropertyAll(
          IconThemeData(
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        backgroundColor: Theme.of(context).colorScheme.surface,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      child: NavigationBar(
        height: 70,
        selectedIndex: currentValue,
        elevation: 1,
        animationDuration: const Duration(milliseconds: 1000),
        onDestinationSelected: (valueIndex) {
          setState(() {
            currentValue = valueIndex;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: Icon(
              Icons.person_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Perfil',
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_border),
            selectedIcon: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Favoritos',
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: Icon(
              Icons.settings_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}

class TitleCover extends StatelessWidget {
  const TitleCover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Monstera\n Unique',
      style: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class PlantCover extends StatelessWidget {
  const PlantCover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Container(
          width: double.infinity,
          height: 275,
          decoration: const BoxDecoration(color: Colors.red),
          child: Image.asset(
            'assets/images/monstera-unique.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<ModelsListCover> cardItems = [
      ModelsListCover(
        id: 1,
        title: 'Most Popular',
        leading: 'This is a popular plant in our store',
        icon: const Icon(Icons.auto_awesome_rounded),
      ),
      ModelsListCover(
        id: 2,
        title: 'Easy care',
        leading: 'This plant is apropiate for beginners',
        icon: const Icon(Icons.assignment_rounded),
      ),
      ModelsListCover(
        id: 3,
        title: 'Faux Available',
        leading: 'Get the same look without the maintenance',
        icon: const Icon(Icons.park_rounded),
      ),
      ModelsListCover(
        id: 4,
        title: 'Better',
        leading: 'Better for you page and home',
        icon: const Icon(Icons.grade),
      ),
    ];

    return AspectRatio(
      aspectRatio: 2.45,
      child: SizedBox(
        height: double.infinity,
        child: GridView.builder(
          reverse: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: cardItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 0,
                bottom: 10,
              ),
              child: Container(
                key: ValueKey(cardItems[index].id),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cardItems[index].icon,
                        const SizedBox(height: 5),
                        Text(
                          cardItems[index].title,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cardItems[index].leading,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
