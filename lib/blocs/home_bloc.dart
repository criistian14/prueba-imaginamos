import 'dart:async';

// Models
import 'package:prueba/models/movie_category_model.dart';
import 'package:prueba/models/movie_model.dart';

// Providers
import 'package:prueba/providers/movie_api_provider.dart';

class HomeBloc {
  MovieApiProvider _movieApiProvider = MovieApiProvider();

  // =====================================================================
  // Streams
  // =====================================================================
  final _movieList = StreamController<List<MovieModel>>.broadcast();
  final _loadingMovieList = StreamController<bool>.broadcast();
  final _errorMovieList = StreamController<String>.broadcast();

  // =====================================================================
  // Setters
  // =====================================================================
  Function(List<MovieModel>) get setMovieList => _movieList.sink.add;
  Function(bool) get setLoadingMovieList => _loadingMovieList.sink.add;
  Function(String) get setErrorMovieList => _errorMovieList.sink.add;

  // =====================================================================
  // Getters
  // =====================================================================
  Stream<List<MovieModel>> get movieList => _movieList.stream;
  Stream<bool> get loadingMovieList => _loadingMovieList.stream;
  Stream<String> get errorMovieList => _errorMovieList.stream;

  // =====================================================================
  // Fetch Movies
  // =====================================================================
  void fetchMovies({
    int page = 1,
    TypeMovieCategory typeMovie,
  }) async {
    setLoadingMovieList(true);
    Map response = await _movieApiProvider.getMovies(
      page: page,
      typeMovie: typeMovie,
    );

    if (response["error"]) {
      setLoadingMovieList(false);
      setErrorMovieList(response["messageError"]);
      return;
    }

    setLoadingMovieList(false);
    setMovieList(response["movies"]);
  }

  // Dispose
  void dispose() async {
    await _movieList?.close();
    await _loadingMovieList?.close();
    await _errorMovieList?.close();
  }
}
