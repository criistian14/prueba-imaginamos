import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/home/top_card.dart';

class AppBarHome extends StatefulWidget {
  AppBarHome({Key key}) : super(key: key);

  @override
  _AppBarHomeState createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      elevation: 0,
      stretch: false,
      expandedHeight: SizeConfig.safeBlockVertical * 30,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: TopCardHome(),
      ),
    );
  }
}
