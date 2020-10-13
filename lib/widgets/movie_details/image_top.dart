import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/app_config.dart';
import 'package:prueba/utils/size_config.dart';

// Models
import 'package:prueba/models/movie_model.dart';

class ImageTopMovieDetails extends StatefulWidget {
  final MovieModel movie;

  ImageTopMovieDetails({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  _ImageTopMovieDetailsState createState() => _ImageTopMovieDetailsState();
}

class _ImageTopMovieDetailsState extends State<ImageTopMovieDetails> {
  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: _heightContainer(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Banner Image
          _banner(),

          // Actions
          _actions(),
        ],
      ),
    );
  }

  // =====================================================================
  // Banner Image
  // =====================================================================
  Widget _banner() {
    // Fit Image Banner (Responsive)
    BoxFit _fitImageBanner = BoxFit.fitHeight;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fitImageBanner = BoxFit.fitWidth;
    }

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/loading.gif",
        image: "${AppConfig.urlImage}/original${widget.movie.backdropPath}",
        fit: _fitImageBanner,
      ),
    );
  }

  // =====================================================================
  // Actions
  // =====================================================================
  Widget _actions() {
    // Size Icon (Responsive)
    double _sizeIcon = SizeConfig.safeBlockHorizontal * 6;
    if (SizeConfig.orientation == Orientation.landscape) {
      _sizeIcon = SizeConfig.safeBlockHorizontal * 4;
    }

    return Positioned(
      left: 0,
      right: 0,
      top: MediaQuery.of(context).padding.top +
          (SizeConfig.safeBlockVertical * 3),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                size: _sizeIcon,
              ),
            ),

            // Like
            FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.favorite_border,
                size: _sizeIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ====================================================================
  // Height Container (Responsive)
  // ====================================================================
  double _heightContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 84;
    }

    return SizeConfig.safeBlockVertical * 45;
  }
}
