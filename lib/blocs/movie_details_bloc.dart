import 'dart:async';
import 'package:meta/meta.dart';

// Models
import 'package:prueba/models/movie_model.dart';

// Providers
import 'package:prueba/providers/movie_api_provider.dart';

class MovieDetailsBloc {
  MovieApiProvider _movieApiProvider = MovieApiProvider();

  // =====================================================================
  // Streams
  // =====================================================================
  final _movie = StreamController<MovieModel>.broadcast();
  final _loading = StreamController<bool>.broadcast();

  final _errorMessage = StreamController<String>.broadcast();

  // =====================================================================
  // Setters
  // =====================================================================
  Function(MovieModel) get setMovie => _movie.sink.add;
  Function(bool) get setLoading => _loading.sink.add;

  Function(String) get setErrorMessage => _errorMessage.sink.add;

  // =====================================================================
  // Getters
  // =====================================================================
  Stream<MovieModel> get movie => _movie.stream;
  Stream<bool> get loading => _loading.stream;

  Stream<String> get errorMessage => _errorMessage.stream;

  // =====================================================================
  // Fetch Movie Details
  // =====================================================================
  void fetchMovieDetails({
    @required int id,
  }) async {
    setLoading(true);
    Map response = await _movieApiProvider.getMovieDetails(
      id: id,
    );

    if (response["error"]) {
      setLoading(false);
      setErrorMessage(response["messageError"]);
      return;
    }

    setLoading(false);
    setMovie(response["movie"]);
  }

  // Dispose
  void dispose() async {
    await _movie?.close();
    await _loading?.close();

    await _errorMessage?.close();
  }
}
