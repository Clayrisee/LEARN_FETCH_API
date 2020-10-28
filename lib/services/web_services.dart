import 'dart:convert';

import 'package:learn_fetch_api/const.dart';
import 'package:learn_fetch_api/model/movie.dart';
import 'package:http/http.dart' as http;

class WebService {
  //Create method to load list movie

  Future<List<Movie>> fetchMovies(String keyword) async {
    //base url for consume api
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=$API_KEY";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //request berhasil
      final body = jsonDecode(response.body);
      final Iterable json = body['Search'];

      // return json to list
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unexpected Error!!");
    }
  }
}
