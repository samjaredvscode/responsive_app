import 'package:flutter/material.dart';

class RamdonContainers extends StatelessWidget {
  const RamdonContainers({
    super.key,
    required this.index,
    this.width = 50,
    this.height = 50,
    this.color = Colors.blue,
    this.colorText,
  });

  final int index;
  final double width;
  final double height;
  final Color color;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
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
