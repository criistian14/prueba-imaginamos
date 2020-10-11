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
  // Banner Image
  // =====================================================================
  Widget _banner() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: FadeInImage.assetNetwork(
        placeholder: "assets/images/lsb-loading.gif",
        image: "${AppConfig.urlImage}${widget.movie.backdropPath}",
        fit: BoxFit.fitHeight,
      ),
    );
  }

  // =====================================================================
  // Actions
  // =====================================================================
  Widget _actions() {
    return Positioned(
      left: 0,
      right: 0,
      top: SizeConfig.safeBlockVertical * 5,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
              ),
            ),

            // Like
            Icon(
              Icons.favorite_border,
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 45,
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
}
