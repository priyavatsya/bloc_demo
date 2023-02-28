// import 'package:flutter/material.dart';
// import '../../model/movie_model.dart';
// import '../../repo/movie_repo.dart';
//
// class MoviesProvider extends ChangeNotifier {
//   List<MovieModel> movieModel = [];
//   MoviesRepository _moviesRepository = MoviesRepository();
//
//   MoviesProvider() {
//     getMovies();
//   }
//
//   void getMovies() {
//     print("getMovies inside provider");
//     _moviesRepository.fetchMovies().then((value) {
//       movieModel = value;
//       notifyListeners();
//     });
//   }
// }