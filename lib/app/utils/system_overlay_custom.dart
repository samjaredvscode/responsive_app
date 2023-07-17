import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayUser extends SystemUiOverlayStyle {
  SystemUiOverlayUser(this.context)
      : super(
          systemNavigationBarColor: Theme.of(context).colorScheme.background,
        );

  final BuildContext context;
}
