import 'package:flutter/material.dart';

class RamdonContainers extends StatelessWidget {
  const RamdonContainers({
    super.key,
    required this.index,
    this.width = 100,
    this.height = 100,
    this.color = Colors.blue,
    this.colorText,
    this.borderRadius,
    this.padding,
  });

  final int index;
  final double width;
  final double height;
  final Color? color;
  final Color? colorText;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(6),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: colorText ?? Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
