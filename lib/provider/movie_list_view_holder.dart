import 'package:flutter/foundation.dart';
import 'package:learn_fetch_api/model/movie.dart';
import 'package:learn_fetch_api/services/web_services.dart';

class MovieListViewHolder extends ChangeNotifier {
  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<void> fetchMovies(String keyword) async {
    //TODO : implement function
    final results = await WebService().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(item)).toList();

    //check if success
    print(this.movies);
    notifyListeners();
  }
}

class MovieViewModel {
  final Movie movie;
  MovieViewModel(this.movie);

//implement getter and setter
  String get title {
    return this.movie.title;
  }

  String get poster {
    return this.movie.poster;
  }
}
