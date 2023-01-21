import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class SystemOverlayCustom {
  static SystemUiOverlayStyle overlay(
    BuildContext context,
  ) {
    return SystemUiOverlayStyle(
      systemNavigationBarColor: Theme.of(context).colorScheme.background,
    );
  }
}
