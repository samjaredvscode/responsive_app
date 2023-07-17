import 'package:flutter/material.dart';

class RacingView extends StatelessWidget {
  const RacingView({super.key});

  @override
  Widget build(BuildContext context) {
    final constantes = [
      'Administración de Empresas',
      'Secretariado Ejecutivo Computarizado',
      'Administración de Redes y Comunicaciones',
      'Administración de Operaciones Turísticas',
    ];
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          ...constantes.map(
            (items) => FilledButton(
              style: FilledButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  items,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
