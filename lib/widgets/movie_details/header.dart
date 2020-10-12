import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Models
import 'package:prueba/models/movie_model.dart';

// Widgets
import 'package:prueba/widgets/star_rating.dart';

class HeaderMovieDetails extends StatefulWidget {
  final MovieModel movie;

  HeaderMovieDetails({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  _HeaderMovieDetailsState createState() => _HeaderMovieDetailsState();
}

class _HeaderMovieDetailsState extends State<HeaderMovieDetails> {
  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 8,
      ),
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 5,
      ),
      child: Column(
        children: [
          // First Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title Movie
              _titleMovie(),

              // Image Resolution 4K
              _resolution(),
            ],
          ),

          // Second Section
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Button Watch Now
                _btnWatchNow(),

                // Rating
                StarRating(
                  rating: widget.movie.voteAverage,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // =====================================================================
  // Button Watch Now
  // =====================================================================
  Widget _btnWatchNow() {
    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 6,
        vertical: SizeConfig.safeBlockVertical * 1.5,
      ),
      child: Text(
        "WATCH NOW",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.safeBlockHorizontal * 2.5,
        ),
      ),
    );
  }

  // =====================================================================
  // Title Movie
  // =====================================================================
  Widget _titleMovie() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 76,
      child: Text(
        widget.movie.title,
        style: Theme.of(context).textTheme.headline5.merge(
              TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 6,
              ),
            ),
      ),
    );
  }

  // =====================================================================
  // Image Resolution (4K)
  // =====================================================================
  Widget _resolution() {
    return ImageIcon(
      AssetImage(
        "assets/images/4k-fullhd.png",
      ),
      color: Theme.of(context).unselectedWidgetColor,
       size: SizeConfig.safeBlockVertical * 2.4,
    );
  }
}
