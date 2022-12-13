import 'package:flutter/material.dart';
import 'package:responsive_app/app/utils/on_hover.dart';

import '../../app/utils/text_button_hovered.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

int currentIndex = 0;

class _DesktopLayoutState extends State<DesktopLayout> {
  List<String> items = ['Sam', 'Jared', 'Asdasdasdada', 'Gárate'];
  String? selectedItems = 'Sam';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('A M E R I C A N   S Y S T E M'),
        actions: [
          OnHover(
            builder: (isHovered) {
              return TextButtonHovered(
                foregroundColor: isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background,
                onPressed: () {},
                child: const Text('INICIO'),
              );
            },
          ),
          const SizedBox(width: 10),
          OnHover(
            builder: (isHovered) {
              return TextButtonHovered(
                foregroundColor: isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background,
                onPressed: () {},
                child: const Text('EL INSTITUTO'),
              );
            },
          ),
          const SizedBox(width: 10),
          OnHover(
            builder: (isHovered) {
              return TextButtonHovered(
                foregroundColor: isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background,
                onPressed: () {},
                child: const Text('CARRERAS'),
              );
            },
          ),
          const SizedBox(width: 10),
          OnHover(
            builder: (isHovered) {
              return TextButtonHovered(
                foregroundColor: isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background,
                onPressed: () {},
                child: const Text('EXTENCIÓN'),
              );
            },
          ),
          const SizedBox(width: 10),
          TextButtonHovered(
            onPressed: () {},
            child: const Text('INFORMACIÓN PARA'),
          ),
          const SizedBox(width: 10),
          TextButtonHovered(
            onPressed: () {},
            child: const Text('INTRANET'),
          ),
          const SizedBox(width: 10),
          TextButtonHovered(
            onPressed: () {},
            child: const Text('EVENTOS'),
          ),
        ],
      ),
    );
  }
}
