import 'package:flutter/material.dart';

class ExtensionView extends StatelessWidget {
  const ExtensionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text('Extencion Page'),
      ),
    );
  }
}
