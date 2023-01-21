import 'package:flutter/material.dart';

class IntranetView extends StatelessWidget {
  const IntranetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text('Intranet Page'),
      ),
    );
  }
}
