import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final query = MediaQuery.of(context).size.width;
    if (query > 1024) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.background,
          ),
          child: ListView(
            children: const [
              Center(
                child: Text('Events Page'),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: const Center(
        child: Text('Eventos View'),
      ),
    );
  }
}
