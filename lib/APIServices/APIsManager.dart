import 'package:movies_app/Model/Movies.dart';
import 'package:movies_app/Utilities/URLs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIsManager {
  static Future<List<Movie>> getMovies() async {
    var response = await http.get(URLs.MOVIE_LIST);
    final jsonContent = json.decode(response.body);
    var movies = Movies.fromJson(jsonContent);
    for (int index = 0; index < movies.movies.length; index++) {
      movies.movies[index].tralier =URLs.webViewHtmlTraliers[index];
    }
    return movies.movies;
  }
}
