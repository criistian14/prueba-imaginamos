import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/home/app_bar.dart';
import 'package:prueba/widgets/home/movie_category.dart';

// Blocs
import 'package:prueba/blocs/theme_bloc.dart';
import 'package:prueba/blocs/home_bloc.dart';

// Models
import 'package:prueba/models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  final ThemeBloc themeBloc;

  HomeScreen({Key key, @required this.themeBloc}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();

    _homeBloc.initState();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  // ====================================================================
  // Recommended Movies
  // ====================================================================
  Widget _recommendedMovies() {
    return StreamBuilder<bool>(
      stream: _homeBloc.loadingRecommendedMovies,
      initialData: true,
      builder: (context, loading) {
        return StreamBuilder<List<MovieModel>>(
          stream: _homeBloc.listRecommendedMovies,
          initialData: [],
          builder: (context, movieList) {
            return MovieCategory(
              isFirst: true,
              homeBloc: _homeBloc,
              title: "Recommended For You",
              loading: loading.data,
              movies: movieList.data,
            );
          },
        );
      },
    );
  }

  // ====================================================================
  // Top Rated Movies
  // ====================================================================
  Widget _topRatedMovies() {
    return StreamBuilder<bool>(
      stream: _homeBloc.loadingTopRatedMovies,
      initialData: true,
      builder: (context, loading) {
        return StreamBuilder<List<MovieModel>>(
          stream: _homeBloc.listTopRatedMovies,
          initialData: [],
          builder: (context, movieList) {
            return MovieCategory(
              homeBloc: _homeBloc,
              title: "Top Rated",
              loading: loading.data,
              movies: movieList.data,
            );
          },
        );
      },
    );
  }

  // ====================================================================
  // Trending Week Movies
  // ====================================================================
  Widget _trendingWeekMovies() {
    return StreamBuilder<bool>(
      stream: _homeBloc.loadingTrendingMovies,
      initialData: true,
      builder: (context, loading) {
        return StreamBuilder<List<MovieModel>>(
          stream: _homeBloc.listTrendingMovies,
          initialData: [],
          builder: (context, movieList) {
            return MovieCategory(
              homeBloc: _homeBloc,
              title: "Trending - Week",
              loading: loading.data,
              movies: movieList.data,
            );
          },
        );
      },
    );
  }

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar With Search
              AppBarHome(themeBloc: widget.themeBloc),

              // List Movies
              SliverList(
                delegate: SliverChildListDelegate([
                  _recommendedMovies(),
                  _topRatedMovies(),
                  _trendingWeekMovies(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
