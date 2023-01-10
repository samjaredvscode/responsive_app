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
      ),
      child: TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          minimumSize: minimunSize ?? const Size(220, 90),
        ),
        child: const Text(
          'Empezar',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
