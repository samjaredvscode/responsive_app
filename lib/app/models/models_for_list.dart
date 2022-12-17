import 'package:flutter/cupertino.dart';

class ModelsListCover {
  final int id;
  final String title;
  final String leading;
  final Icon icon;

  ModelsListCover({
    required this.id,
    this.title = 'null',
    this.leading = 'null',
    required this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'leading': leading,
      'icon': icon,
    };
  }
}

class ModelListTema {
  final String title;
  final Icon icon;

  ModelListTema({
    required this.title,
    required this.icon,
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
