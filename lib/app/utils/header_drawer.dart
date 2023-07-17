import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 10,
        right: 10,
        bottom: 20,
      ),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                maxRadius: 45,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            Positioned(
              right: 5,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.nightlight_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
