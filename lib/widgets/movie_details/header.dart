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
    // Size (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 2.5;
    // Padding (Responsive)
    EdgeInsets _padding = EdgeInsets.symmetric(
      horizontal: SizeConfig.safeBlockHorizontal * 6,
      vertical: SizeConfig.safeBlockVertical * 1.5,
    );
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 2;
      _padding = EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
        vertical: SizeConfig.safeBlockVertical * 2.5,
      );
    }

    return RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: _padding,
      child: Text(
        "WATCH NOW",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: _fontSize,
        ),
      ),
    );
  }

  // =====================================================================
  // Title Movie
  // =====================================================================
  Widget _titleMovie() {
    // Size Icon (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 6;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 3.4;
    }

    return Container(
      width: SizeConfig.safeBlockHorizontal * 76,
      child: Text(
        widget.movie.title,
        style: Theme.of(context).textTheme.headline5.merge(
              TextStyle(
                fontSize: _fontSize,
              ),
            ),
      ),
    );
  }

  // =====================================================================
  // Image Resolution (4K)
  // =====================================================================
  Widget _resolution() {
    // Size (Responsive)
    double _size = SizeConfig.safeBlockVertical * 2.4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _size = SizeConfig.safeBlockVertical * 5.4;
    }

    return ImageIcon(
      AssetImage(
        "assets/images/4k-fullhd.png",
      ),
      color: Theme.of(context).unselectedWidgetColor,
      size: _size,
    );
  }
}
