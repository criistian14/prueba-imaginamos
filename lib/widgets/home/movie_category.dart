import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/home/movie_card.dart';
import 'package:prueba/widgets/home/loading_movie_card.dart';

// Models
import 'package:prueba/models/movie_model.dart';

// Blocs
import 'package:prueba/blocs/home_bloc.dart';

class MovieCategory extends StatefulWidget {
  final HomeBloc homeBloc;
  final String title;
  final bool isFirst, loading;
  final List<MovieModel> movies;

  MovieCategory({
    Key key,
    this.isFirst = false,
    @required this.loading,
    @required this.homeBloc,
    @required this.title,
    @required this.movies,
  }) : super(key: key);

  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  @override
  void initState() {
    super.initState();

    // widget.homeBloc.fetchMovies(
    //   typeMovie: widget.movieCategory.typeMovieCategory,
    // );
  }

  // ====================================================================
  // Title Category
  // ====================================================================
  Widget _titleCategory() {
    return Container(
      padding: EdgeInsets.only(
        right: SizeConfig.safeBlockHorizontal * 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title.toUpperCase(),
            style: Theme.of(context).textTheme.headline5.merge(
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.3,
                  ),
                ),
          ),
          Text(
            "See all",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  // ====================================================================
  // Movie List
  // ====================================================================
  Widget _movieList() {
    if (widget.loading) {
      return _loadingMovieList();
    }

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 3,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: widget.movies[index],
          );
        },
        itemCount: widget.movies.length,
      ),
    );
  }

  // ====================================================================
  // Loading Movie List
  // ====================================================================
  Widget _loadingMovieList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 3,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return LoadingMovieCard();
        },
        itemCount: 10,
      ),
    );
  }

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.safeBlockVertical * 45,
      width: SizeConfig.safeBlockHorizontal * 100,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.only(
        top: _validatePaddingTop(),
        left: SizeConfig.safeBlockHorizontal * 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: _validateRadius(),
      ),
      child: Column(
        children: [
          // Title Category
          _titleCategory(),

          _movieList(),

          // Movie List
          // StreamBuilder<List<MovieModel>>(
          //   stream: widget.homeBloc.movieList,
          //   builder: (context, movieList) {
          //     return StreamBuilder<bool>(
          //       initialData: true,
          //       stream: widget.homeBloc.loadingMovieList,
          //       builder: (context, loadingMovieList) {
          //         if (loadingMovieList.data) {
          //           return _loadingMovieList();
          //         }

          //         if (!movieList.hasData && movieList.data == null) {
          //           return Container();
          //         }

          //         return _movieList(movieList.data);
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  // ====================================================================
  // Validate Border Radius First Category
  // ====================================================================
  BorderRadius _validateRadius() {
    if (widget.isFirst) {
      return BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      );
    }

    return null;
  }

  // ====================================================================
  // Validate Padding Top First Category
  // ====================================================================
  double _validatePaddingTop() {
    if (widget.isFirst) {
      return SizeConfig.safeBlockVertical * 6;
    }

    return SizeConfig.safeBlockVertical * 3;
  }
}
