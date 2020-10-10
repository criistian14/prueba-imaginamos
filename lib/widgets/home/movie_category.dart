import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/home/movie_card.dart';
import 'package:prueba/widgets/home/loading_movie_card.dart';

// Models
import 'package:prueba/models/movie_model.dart';
import 'package:prueba/models/movie_category_model.dart';

// Blocs
import 'package:prueba/blocs/home_bloc.dart';

class MovieCategory extends StatefulWidget {
  final int index;
  final MovieCategoryModel movieCategory;

  MovieCategory({
    Key key,
    @required this.index,
    @required this.movieCategory,
  }) : super(key: key);

  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();

    _homeBloc.fetchMovies(
      typeMovie: widget.movieCategory.typeMovieCategory,
    );
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
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
            widget.movieCategory.name.toUpperCase(),
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
  Widget _movieList(List<MovieModel> movieList) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 3,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movieList[index],
          );
        },
        itemCount: movieList.length,
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

          // Movie List
          StreamBuilder<List<MovieModel>>(
            stream: _homeBloc.movieList,
            builder: (context, movieList) {
              return StreamBuilder<bool>(
                initialData: true,
                stream: _homeBloc.loadingMovieList,
                builder: (context, loadingMovieList) {
                  if (loadingMovieList.data) {
                    return _loadingMovieList();
                  }

                  if (!movieList.hasData && movieList.data == null) {
                    return Container();
                  }

                  return _movieList(movieList.data);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // ====================================================================
  // Validate Border Radius First Category
  // ====================================================================
  BorderRadius _validateRadius() {
    if (widget.index == 0) {
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
    if (widget.index == 0) {
      return SizeConfig.safeBlockVertical * 6;
    }

    return SizeConfig.safeBlockVertical * 3;
  }
}
