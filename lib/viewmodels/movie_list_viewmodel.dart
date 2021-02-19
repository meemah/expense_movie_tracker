import 'package:expense_movie_tracker/model/movie_model.dart';
import 'package:expense_movie_tracker/networking/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:expense_movie_tracker/networking/api_client.dart';

class MovieListViewmodel with ChangeNotifier {
  MovieListViewmodel() {
    fetchMovies();
  }
  ApiResponse<List<MovieModel>> _allMovies;

  get allMovies => this._allMovies;

  set allMovies(ApiResponse<List<MovieModel>> response) {
    _allMovies = response;
    notifyListeners();
  }

  fetchMovies() async {
    _allMovies = ApiResponse.loading("Loading");
    try {
      final response = await ApiClient().get();
      List<MovieModel> _movies = movieModelFromJson(response);
      allMovies = ApiResponse.completed(_movies);
    } catch (e) {
      print(e.toString());
      allMovies = ApiResponse.error(e.toString());
    }
  }
}
