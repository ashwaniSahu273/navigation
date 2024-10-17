import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
 List<Movie> _movieList = [
  
  ];

  List<Movie> get movieList => _movieList;

  Future<void> loadMovies(BuildContext context) async {
    try {
       final jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/Film.JSON");
       final movies = MovieParser.parse(jsonString);
       _movieList = movies;
       notifyListeners();
    }
    catch (e){
    print("This is movie ");
    }

  }
}
