import 'package:flutter/material.dart';

class TextButtonHovered extends StatelessWidget {
  const TextButtonHovered({
    super.key,
    this.onPressed,
    this.overlayColor = Colors.transparent,
    this.foregroundColor,
    this.autoFocus = true,
    this.backGroundColor,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Color? overlayColor;
  final Color? foregroundColor;
  final Color? backGroundColor;
  final Widget child;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      autofocus: autoFocus,
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(overlayColor),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
        backgroundColor: MaterialStatePropertyAll(backGroundColor),
      ),
      child: child,
    );
  }
}
