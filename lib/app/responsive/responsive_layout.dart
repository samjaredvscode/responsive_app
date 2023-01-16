import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobilScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  final Widget mobilScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 520) return mobilScaffold;
        if (constraints.maxWidth < 1024) return tabletScaffold;
        return desktopScaffold;
      },
    );
  }
}
