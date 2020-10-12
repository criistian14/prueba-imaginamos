import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/app_config.dart';
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/star_rating.dart';

// Models
import 'package:prueba/models/movie_model.dart';

// Screens
import 'package:prueba/screens/movie_details_screen.dart';

class MovieCard extends StatefulWidget {
  final MovieModel movie;

  MovieCard({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: _openMovieDetails,
      child: Container(
        margin: EdgeInsets.only(
          right: SizeConfig.safeBlockHorizontal * 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _thumbnailMovie(),
            _titleMovie(),
            StarRating(
              rating: widget.movie.voteAverage,
            ),
          ],
        ),
      ),
    );
  }

  // ====================================================================
  // Thumbnail Movie
  // ====================================================================
  Widget _thumbnailMovie() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 30,
      height: SizeConfig.safeBlockHorizontal * 37,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage.assetNetwork(
          placeholder: "assets/images/lsb-loading.gif",
          image: "${AppConfig.urlImage}/w500${widget.movie.posterPath}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ====================================================================
  // Title Movie
  // ====================================================================
  Widget _titleMovie() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 30,
      height: SizeConfig.safeBlockVertical * 2,
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * .5,
      ),
      child: Text(
        widget.movie.title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1.merge(
              TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 3,
              ),
            ),
      ),
    );
  }

  // ====================================================================
  // Open Movie Details
  // ====================================================================
  void _openMovieDetails() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) =>
            MovieDetailsScreen(
          movie: widget.movie,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.decelerate));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
