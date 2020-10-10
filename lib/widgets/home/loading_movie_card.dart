import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

class LoadingMovieCard extends StatefulWidget {
  LoadingMovieCard({Key key}) : super(key: key);

  @override
  _LoadingMovieCardState createState() => _LoadingMovieCardState();
}

class _LoadingMovieCardState extends State<LoadingMovieCard> {
  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 28,
      margin: EdgeInsets.only(
        right: SizeConfig.safeBlockHorizontal * 7,
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
