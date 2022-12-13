import 'package:flutter/material.dart';

class MyCustomBox extends StatelessWidget {
  const MyCustomBox({
    super.key,
    this.height,
    this.color,
    this.borderRadius,
    this.child,
  });

  final double? height;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Text? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color ?? Colors.grey,
          borderRadius: borderRadius ?? BorderRadius.circular(15),
        ),
        child: Center(child: child),
      ),
    );
  }
}
