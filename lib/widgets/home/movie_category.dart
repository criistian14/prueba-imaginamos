import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/home/movie_card.dart';
import 'package:prueba/widgets/home/loading_movie_card.dart';

// Models
import 'package:prueba/models/movie_model.dart';

class MovieCategory extends StatefulWidget {
  final String title;
  final bool isFirst, loading;
  final List<MovieModel> movies;

  MovieCategory({
    Key key,
    this.isFirst = false,
    @required this.loading,
    @required this.title,
    @required this.movies,
  }) : super(key: key);

  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: [
        // Color Primary
        Container(
          height: SizeConfig.safeBlockVertical * 5,
          width: SizeConfig.safeBlockHorizontal * 100,
          color: Theme.of(context).primaryColor,
        ),

        // Content List
        Container(
          height: _heightContainer(),
          width: SizeConfig.safeBlockHorizontal * 100,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(
            top: _validatePaddingTop(),
            left: SizeConfig.safeBlockHorizontal * 8,
          ),
          decoration: BoxDecoration(
            borderRadius: _validateRadius(),
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            children: [
              // Title Category
              _titleCategory(),

              // Movie List
              _movieList(),
            ],
          ),
        ),
      ],
    );
  }

  // ====================================================================
  // Title Category
  // ====================================================================
  Widget _titleCategory() {
    // Font Size Title (Responsive)
    double _fontSizeTitle = SizeConfig.safeBlockHorizontal * 3;
    // Font Size Button "See all" (Responsive)
    double _fontSizeBtn = SizeConfig.safeBlockHorizontal * 2.8;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSizeTitle = SizeConfig.safeBlockHorizontal * 2;
      _fontSizeBtn = SizeConfig.safeBlockHorizontal * 1.9;
    }

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
                    fontSize: _fontSizeTitle,
                  ),
                ),
          ),
          Text(
            "See all",
            style: Theme.of(context).textTheme.subtitle2.merge(
                  TextStyle(
                    fontSize: _fontSizeBtn,
                  ),
                ),
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
          top: SizeConfig.safeBlockVertical * 2.4,
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
          top: SizeConfig.safeBlockVertical * 2.4,
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
  // Validate Border Radius First Category
  // ====================================================================
  BorderRadius _validateRadius() {
    if (widget.isFirst) {
      return BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      );
    }

    return BorderRadius.zero;
  }

  // ====================================================================
  // Validate Padding Top First Category
  // ====================================================================
  double _validatePaddingTop() {
    if (widget.isFirst) {
      // Responsive
      if (SizeConfig.orientation == Orientation.landscape) {
        return SizeConfig.safeBlockVertical * 8;
      }

      return SizeConfig.safeBlockVertical * 4;
    }

    // Responsive
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 6;
    }

    return SizeConfig.safeBlockVertical * 3;
  }

  // ====================================================================
  // Height Container (Responsive)
  // ====================================================================
  double _heightContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 75;
    }

    return SizeConfig.safeBlockVertical * 35.8;
  }
}
