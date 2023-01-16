import 'package:flutter/cupertino.dart';

class ModelListTema {
  final String title;
  final IconData icon;
  final List? subtitle;

  ModelListTema({
    required this.title,
    required this.icon,
    this.subtitle,
  });

  Map<String, dynamic> toJson() {
    return {
      'tite': title,
      'icon': icon,
    };
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
