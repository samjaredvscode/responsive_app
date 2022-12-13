import 'package:flutter/material.dart';

class MyListTiledDrawer extends StatelessWidget {
  const MyListTiledDrawer({
    super.key,
    this.leading,
    this.title,
    this.onTap,
  });

  final Widget? leading;
  final Widget? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        selectedColor: Theme.of(context).colorScheme.onSurface,
        selected: true,
        leading: leading,
        title: title,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: onTap,
      ),
    );
  }
}
