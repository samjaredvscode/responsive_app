import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'field_decoration.dart';
import 'style_icon_button.dart';

class TextFormFieldBase extends HookWidget {
  const TextFormFieldBase({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.helperText,
    this.maxLength,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
  });

  final bool obscureText;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? helperText;
  final TextInputType keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final controllerListenable =
        useListenableSelector(controller, () => controller.text.isNotEmpty);
    final isPassword = useState(obscureText);

    return TextFormField(
      keyboardType: keyboardType,
      maxLength: maxLength,
      controller: controller,
      obscureText: isPassword.value,
      decoration: FieldDecoration(
        helperText: helperText,
        hintText: hintText,
        labelText: labelText,
        prefixIcon: obscureText
            ? const Icon(Icons.password_rounded)
            : prefixIcon ?? const Icon(Icons.payment_rounded),
        suffixIcon: obscureText
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  controllerListenable
                      ? IconButton(
                          style: const StyleIconButton(),
                          onPressed: () => controller.clear(),
                          icon: const Icon(Icons.cancel_rounded),
                        )
                      : const SizedBox(),
                  IconButton(
                    style: const StyleIconButton(),
                    onPressed: () {
                      isPassword.value = !isPassword.value;
                    },
                    icon: Icon(
                      isPassword.value
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  ),
                ],
              )
            : controllerListenable
                ? IconButton(
                    style: const StyleIconButton(),
                    onPressed: () => controller.clear(),
                    icon: const Icon(Icons.cancel_rounded),
                  )
                : null,
      ),
    );
  }
}
