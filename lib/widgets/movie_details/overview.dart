import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Models
import 'package:prueba/models/movie_model.dart';

class OverviewMovieDetails extends StatefulWidget {
  final MovieModel movie;

  OverviewMovieDetails({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  _OverviewMovieDetailsState createState() => _OverviewMovieDetailsState();
}

class _OverviewMovieDetailsState extends State<OverviewMovieDetails> {
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
        top: SizeConfig.safeBlockVertical * 4,
      ),
      child: Text(
        widget.movie.overview,
        style: Theme.of(context).textTheme.bodyText1.merge(
              TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 3.7,
              ),
            ),
      ),
    );
  }
}
