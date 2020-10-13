import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Models
import 'package:prueba/models/movie_model.dart';

class InformationMovieDetails extends StatefulWidget {
  final MovieModel movie;
  final bool loading;

  InformationMovieDetails({
    Key key,
    @required this.movie,
    this.loading = true,
  }) : super(key: key);

  @override
  _InformationMovieDetailsState createState() =>
      _InformationMovieDetailsState();
}

class _InformationMovieDetailsState extends State<InformationMovieDetails> {
  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 8,
      ),
      margin: EdgeInsets.only(
        bottom: SizeConfig.safeBlockVertical * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Studio Info
          _lineInfo(
            title: "Studio",
            data: widget.movie.productionCompaniesFormat,
          ),

          // Genre Info
          _lineInfo(
            title: "Genre",
            data: widget.movie.genresFormat,
          ),

          // Release Info
          _lineInfo(
            title: "Release",
            data: widget.movie.releaseDate.year.toString(),
          ),
        ],
      ),
    );
  }

  // =====================================================================
  // Line With Info
  // =====================================================================
  Widget _lineInfo({
    String title,
    String data,
  }) {
    // Font Size (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 3.3;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 2.2;
    }

    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.safeBlockVertical * 1.2,
      ),
      child: Row(
        children: [
          // Title
          Container(
            width: SizeConfig.safeBlockHorizontal * 18,
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1.merge(
                    TextStyle(
                      fontSize: _fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            ),
          ),

          // Info
          Expanded(
            child: Text(
              data,
              style: Theme.of(context).textTheme.subtitle2.merge(
                    TextStyle(
                      fontSize: _fontSize,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
