import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  const OnHover({
    super.key,
    required this.builder,
  });

  final Widget Function(bool isHovered) builder;

  @override
  State<OnHover> createState() => _OnHoverState();
}

bool isHovered = false;

class _OnHoverState extends State<OnHover> {
  void onEntered(bool isHover) {
    setState(() {
      isHovered = isHover;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      hitTestBehavior: HitTestBehavior.translucent,
      cursor: MouseCursor.defer,
      onHover: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }
}
