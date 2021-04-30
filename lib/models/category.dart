import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imageurl;

  const Category({
    this.color = Colors.orange,
    @required this.id,
    @required this.title,
    @required this.imageurl,
  });
}
