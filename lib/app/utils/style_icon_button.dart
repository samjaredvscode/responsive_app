import 'package:flutter/material.dart';

class StyleIconButton extends ButtonStyle {
  const StyleIconButton()
      : super(
          fixedSize: const MaterialStatePropertyAll<Size?>(Size(20, 20)),
          iconSize: const MaterialStatePropertyAll<double?>(20),
        );
}
