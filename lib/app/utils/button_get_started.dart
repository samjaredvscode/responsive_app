import 'package:flutter/material.dart';

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({
    super.key,
    this.minimunSize,
    this.onPressed,
  });

  final Size? minimunSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          fixedSize: const Size(250, 80),
        ),
        child: const Text(
          'Empezar',
          style: TextStyle(
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
