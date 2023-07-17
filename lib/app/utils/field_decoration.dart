import 'package:flutter/material.dart';

class FieldDecoration extends InputDecoration {
  const FieldDecoration({
    required super.hintText,
    required super.labelText,
    super.prefixIcon,
    super.suffixIcon,
    super.helperText,
  }) : super(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(16, 16),
            ),
          ),
        );
}
