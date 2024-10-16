import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final List<String> _movieList = [
    "Avengers",
    "Spiderman",
    "Batman",
    "Entman",
    "Ironman",
  ];

  List<String> get movieList => _movieList;
}
