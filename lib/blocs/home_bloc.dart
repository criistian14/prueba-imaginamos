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
  final _listRecommendedMovies = StreamController<List<MovieModel>>.broadcast();
  final _loadingRecommendedMovies = StreamController<bool>.broadcast();

  final _listTopRatedMovies = StreamController<List<MovieModel>>.broadcast();
  final _loadingTopRatedMovies = StreamController<bool>.broadcast();

  final _listTrendingMovies = StreamController<List<MovieModel>>.broadcast();
  final _loadingTrendingMovies = StreamController<bool>.broadcast();

  final _errorMovieList = StreamController<String>.broadcast();

  // =====================================================================
  // Setters
  // =====================================================================
  Function(List<MovieModel>) get setListRecommendedMovies =>
      _listRecommendedMovies.sink.add;
  Function(bool) get setLoadingRecommendedMovies =>
      _loadingRecommendedMovies.sink.add;

  Function(List<MovieModel>) get setListTopRatedMovies =>
      _listTopRatedMovies.sink.add;
  Function(bool) get setLoadingTopRatedMovies =>
      _loadingTopRatedMovies.sink.add;

  Function(List<MovieModel>) get setListTrendingMovies =>
      _listTrendingMovies.sink.add;
  Function(bool) get setLoadingTrendingMovies =>
      _loadingTrendingMovies.sink.add;

  Function(String) get setErrorMovieList => _errorMovieList.sink.add;

  // =====================================================================
  // Getters
  // =====================================================================
  Stream<List<MovieModel>> get listRecommendedMovies =>
      _listRecommendedMovies.stream;
  Stream<bool> get loadingRecommendedMovies => _loadingRecommendedMovies.stream;

  Stream<List<MovieModel>> get listTopRatedMovies => _listTopRatedMovies.stream;
  Stream<bool> get loadingTopRatedMovies => _loadingTopRatedMovies.stream;

  Stream<List<MovieModel>> get listTrendingMovies => _listTrendingMovies.stream;
  Stream<bool> get loadingTrendingMovies => _loadingTrendingMovies.stream;

  Stream<String> get errorMovieList => _errorMovieList.stream;

  // =====================================================================
  // Init State
  // =====================================================================
  void initState() {
    fetchRecommendedMovies();
    fetchTopRatedMovies();
    fetchTrendingMovies();
  }

  // =====================================================================
  // Fetch Recommended Movies
  // =====================================================================
  void fetchRecommendedMovies({
    int page = 1,
  }) async {
    setLoadingRecommendedMovies(true);
    Map response = await _movieApiProvider.getMovies(
      page: page,
      typeMovie: TypeMovieCategory.popular,
    );

    if (response["error"]) {
      setLoadingRecommendedMovies(false);
      setErrorMovieList(response["messageError"]);
      return;
    }

    setLoadingRecommendedMovies(false);
    setListRecommendedMovies(response["movies"]);
  }

  // =====================================================================
  // Fetch Top Rated Movies
  // =====================================================================
  void fetchTopRatedMovies({
    int page = 1,
  }) async {
    setLoadingTopRatedMovies(true);
    Map response = await _movieApiProvider.getMovies(
      page: page,
      typeMovie: TypeMovieCategory.topRated,
    );

    if (response["error"]) {
      setLoadingTopRatedMovies(false);
      setErrorMovieList(response["messageError"]);
      return;
    }

    setLoadingTopRatedMovies(false);
    setListTopRatedMovies(response["movies"]);
  }

  // =====================================================================
  // Fetch Trending Week Movies
  // =====================================================================
  void fetchTrendingMovies({
    int page = 1,
  }) async {
    setLoadingTrendingMovies(true);
    Map response = await _movieApiProvider.getMovies(
      page: page,
      typeMovie: TypeMovieCategory.trending,
    );

    if (response["error"]) {
      setLoadingTrendingMovies(false);
      setErrorMovieList(response["messageError"]);
      return;
    }

    setLoadingTrendingMovies(false);
    setListTrendingMovies(response["movies"]);
  }

  // Dispose
  void dispose() async {
    await _listRecommendedMovies?.close();
    await _loadingRecommendedMovies?.close();

    await _listTopRatedMovies?.close();
    await _loadingTopRatedMovies?.close();

    await _listTrendingMovies?.close();
    await _loadingTrendingMovies?.close();

    await _errorMovieList?.close();
  }
}
