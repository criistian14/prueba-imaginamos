import 'dart:convert';

// Libraries
import 'package:http/http.dart' as http;

// Utilities
import 'package:prueba/app_config.dart';

// Models
import 'package:prueba/models/movie_model.dart';
import 'package:prueba/models/movie_category_model.dart';

class MovieApiProvider {
  // ====================================================================
  // Get Movies
  // ====================================================================
  Future<Map> getMovies({
    int page = 1,
    TypeMovieCategory typeMovie,
  }) async {
    Map returnApi = {
      "error": false,
      "messageError": null,
      "movies": [],
    };

    try {
      String url = _urlGetMovies(
        page: page,
        typeMovie: typeMovie,
      );

      // Send Request
      var response = await http.get(url);

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<MovieModel> _movieList = List<MovieModel>();

        // Parse movie list to objects
        if (parsed["results"] != null) {
          for (var item in parsed["results"]) {
            MovieModel _movieTemp = MovieModel.fromJson(item);

            // Only movie has image
            if (_movieTemp.posterPath != null) {
              _movieList.add(_movieTemp);
            }
          }
        }

        returnApi["movies"] = _movieList;

        // Error Handling
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        returnApi["error"] = true;
        returnApi["messageError"] = parsed["status_message"];
      }
    } catch (e) {
      returnApi["messageError"] = "Error With Server";
      returnApi["error"] = true;
    }

    return returnApi;
  }

  // ====================================================================
  // Get Url Movies By Category
  // ====================================================================
  String _urlGetMovies({
    int page,
    TypeMovieCategory typeMovie,
  }) {
    String url;

    switch (typeMovie) {
      case TypeMovieCategory.topRated:
        url =
            "${AppConfig.apiURL}/movie/top_rated${AppConfig.paramApiKey}&page=$page&language=en-US";
        break;

      case TypeMovieCategory.trending:
        url =
            "${AppConfig.apiURL}/trending/movie/week${AppConfig.paramApiKey}&page=$page";
        break;

      case TypeMovieCategory.popular:
        url =
            "${AppConfig.apiURL}/movie/popular${AppConfig.paramApiKey}&page=$page&language=en-US";
        break;

      case TypeMovieCategory.upcoming:
        url =
            "${AppConfig.apiURL}/movie/upcoming${AppConfig.paramApiKey}&page=$page&language=en-US";
        break;

      default:
    }

    return url;
  }
}
