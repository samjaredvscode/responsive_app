import 'package:flutter/material.dart';

class RacingView extends StatelessWidget {
  const RacingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text('Carreras Page'),
      ),
    );
  }
}
