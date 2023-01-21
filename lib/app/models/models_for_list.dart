import 'package:flutter/material.dart';

class ModelListTema {
  final int id;
  final String title;
  final IconData icon;
  final List<String> subtitle;
  final Widget screens;

  ModelListTema({
    required this.id,
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.screens,
  });

  ModelListTema copyWith({
    String? title,
    IconData? icon,
    List<String>? subtitle,
    Widget? screens,
  }) {
    return ModelListTema(
      id: id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      subtitle: subtitle ?? this.subtitle,
      screens: screens ?? this.screens,
    );
  }
}

class PresentationAS {
  final String title;
  final String subtitle;

  PresentationAS({
    required this.title,
    required this.subtitle,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }
}
