import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Models
import 'package:prueba/models/movie_model.dart';

// Widgets
import 'package:prueba/widgets/movie_details/image_top.dart';
import 'package:prueba/widgets/movie_details/header.dart';
import 'package:prueba/widgets/movie_details/overview.dart';
import 'package:prueba/widgets/movie_details/information.dart';
import 'package:prueba/widgets/movie_details/cast.dart';

// Blocs
import 'package:prueba/blocs/movie_details_bloc.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieModel movie;

  MovieDetailsScreen({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsBloc _movieDetailsBloc = MovieDetailsBloc();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Listen Errors
    _movieDetailsBloc.errorMessage.listen((error) {
      SnackBar _snackBar = SnackBar(
        content: Text(error),
      );

      _scaffoldKey.currentState.showSnackBar(_snackBar);
    });

    _movieDetailsBloc.fetchMovieDetails(id: widget.movie.id);
  }

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: StreamBuilder<MovieModel>(
            initialData: widget.movie,
            stream: _movieDetailsBloc.movie,
            builder: (context, movie) {
              return StreamBuilder<bool>(
                initialData: true,
                stream: _movieDetailsBloc.loading,
                builder: (context, loading) {
                  return Column(
                    children: [
                      // Banner With Actions
                      ImageTopMovieDetails(
                        movie: movie.data,
                      ),

                      // Header
                      HeaderMovieDetails(
                        movie: movie.data,
                      ),

                      // Overview
                      OverviewMovieDetails(
                        movie: movie.data,
                      ),

                      // Cast
                      CastMovieDetails(
                        movie: movie.data,
                        loading: loading.data,
                      ),

                      // Information
                      InformationMovieDetails(
                        movie: movie.data,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
