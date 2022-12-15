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
