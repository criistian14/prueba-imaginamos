import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/app_config.dart';
import 'package:prueba/utils/size_config.dart';

// Models
import 'package:prueba/models/movie_model.dart';

class CastMovieDetails extends StatefulWidget {
  final MovieModel movie;
  final bool loading;

  CastMovieDetails({
    Key key,
    @required this.movie,
    this.loading = true,
  }) : super(key: key);

  @override
  _CastMovieDetailsState createState() => _CastMovieDetailsState();
}

class _CastMovieDetailsState extends State<CastMovieDetails> {
  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: _heightContainer(),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 8,
      ),
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 4,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (widget.loading) {
            return _loadingPeople();
          }

          return _person(index);
        },
        itemCount: widget.loading ? 10 : widget.movie.peopleCast.length,
      ),
    );
  }

  // =====================================================================
  // Person (Image and Name)
  // =====================================================================
  Widget _person(int index) {
    // Width Main Container (Responsive)
    double _withContainer = SizeConfig.safeBlockHorizontal * 16;
    // Size Container Profile Picture (Responsive)
    Size _sizeContainerProfile = Size(
      SizeConfig.safeBlockHorizontal * 13,
      SizeConfig.safeBlockHorizontal * 13,
    );
    // Size Container Name (Responsive)
    Size _sizeContainerName = Size(
      SizeConfig.safeBlockHorizontal * 16,
      SizeConfig.safeBlockVertical * 5,
    );
    // Font Size Name (Responsive)
    double _fontSizeName = SizeConfig.safeBlockHorizontal * 3.3;
    if (SizeConfig.orientation == Orientation.landscape) {
      _withContainer = SizeConfig.safeBlockHorizontal * 13;
      _sizeContainerProfile = Size(
        SizeConfig.safeBlockHorizontal * 7,
        SizeConfig.safeBlockHorizontal * 7,
      );
      _sizeContainerName = Size(
        SizeConfig.safeBlockHorizontal * 13,
        SizeConfig.safeBlockVertical * 16,
      );
      _fontSizeName = SizeConfig.safeBlockHorizontal * 2;
    }

    return Container(
      width: _withContainer,
      margin: EdgeInsets.only(
        right: SizeConfig.safeBlockVertical * 4,
      ),
      child: Column(
        children: [
          // Profile Picture
          Container(
            width: _sizeContainerProfile.width,
            height: _sizeContainerProfile.height,
            child: _profilePicture(index),
          ),

          // Name
          Container(
            width: _sizeContainerName.width,
            height: _sizeContainerName.height,
            margin: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 1.5,
            ),
            child: Text(
              widget.movie.peopleCast[index].name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2.merge(
                    TextStyle(
                      fontSize: _fontSizeName,
                    ),
                  ),
            ),
          )
        ],
      ),
    );
  }

  // =====================================================================
  // Profile Picture
  // =====================================================================
  Widget _profilePicture(int index) {
    if (widget.movie.peopleCast[index].profilePath == null) {
      return CircleAvatar(
        child: Text(widget.movie.peopleCast[index].name[0]),
        backgroundColor: Theme.of(context).unselectedWidgetColor,
      );
    }

    return ClipOval(
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/lsb-loading.gif",
        image:
            "${AppConfig.urlImage}/w500${widget.movie.peopleCast[index].profilePath}",
        fit: BoxFit.cover,
      ),
    );
  }

  // =====================================================================
  // Loading
  // =====================================================================
  Widget _loadingPeople() {
    return Container(
      child: Image.asset(
        "assets/images/lsb-loading.gif",
      ),
    );
  }

  // ====================================================================
  // Height Container (Responsive)
  // ====================================================================
  double _heightContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 36;
    }

    return SizeConfig.safeBlockVertical * 15;
  }
}
