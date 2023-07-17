// ignore_for_file: file_names

import 'package:flutter/material.dart';

class KickOffView extends StatelessWidget {
  const KickOffView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: 30,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Items $index'),
            ),
          );
        },
      ),
    );
  }
}
