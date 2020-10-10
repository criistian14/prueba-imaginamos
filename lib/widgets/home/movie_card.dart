import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/app_config.dart';
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/star_rating.dart';

// Models
import 'package:prueba/models/movie_model.dart';

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
  // Thumbnail Movie
  // ====================================================================
  Widget _thumbnailMovie() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 28,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage.assetNetwork(
          placeholder: "assets/images/lsb-loading.gif",
          image: "${AppConfig.urlImage}${widget.movie.posterPath}",
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
      width: SizeConfig.safeBlockHorizontal * 26,
      child: Text(
        widget.movie.title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1.merge(
              TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 3.7,
              ),
            ),
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
      margin: EdgeInsets.only(
        right: SizeConfig.safeBlockHorizontal * 7,
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
    );
  }
}
