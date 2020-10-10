import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

class StarRating extends StatefulWidget {
  final int rating;

  StarRating({
    Key key,
    this.rating = 5,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 23,
      height: SizeConfig.safeBlockVertical * 4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            size: SizeConfig.safeBlockHorizontal * 4,
            color: _validateColor(index),
          );
        },
        itemCount: 5,
      ),
    );
  }

  // ====================================================================
  // Validate Color Star By Rating
  // ====================================================================
  Color _validateColor(int index) {
    if (widget.rating > index) {
      return Colors.yellow;
    }

    return Colors.yellow[100];
  }
}
