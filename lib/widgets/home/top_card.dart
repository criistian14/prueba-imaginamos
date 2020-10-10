import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Blocs
import 'package:prueba/blocs/theme_bloc.dart';

class TopCardHome extends StatefulWidget {
  final ThemeBloc themeBloc;

  TopCardHome({
    Key key,
    @required this.themeBloc,
  }) : super(key: key);

  @override
  _TopCardHomeState createState() => _TopCardHomeState();
}

class _TopCardHomeState extends State<TopCardHome> {
  // ====================================================================
  // Title Home
  // ====================================================================
  Widget _titleHome() {
    return Container(
      child: Text(
        "Hello, what do you \nwant to watch ?",
        style: Theme.of(context).textTheme.headline1.merge(
              TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 6.4,
                height: SizeConfig.safeBlockVertical * 0.22,
              ),
            ),
      ),
    );
  }

  // ====================================================================
  // Search
  // ====================================================================
  Widget _search() {
    return Container(
      height: SizeConfig.safeBlockVertical * 5,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: "Search",
          prefixIcon: _iconSearch(),
        ),
      ),
    );
  }

  // ====================================================================
  // Switch Allow Dark Mode
  // ====================================================================
  Widget _switchDarkMode() {
    return StreamBuilder<bool>(
      initialData: true,
      stream: widget.themeBloc.darkThemeIsEnabled,
      builder: (context, snapshot) {
        return Container(
          height: SizeConfig.safeBlockVertical * 4.5,
          width: SizeConfig.safeBlockHorizontal * 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () => _changeTheme(snapshot.data),
                padding: EdgeInsets.zero,
                minWidth: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: _iconSwitchDarkMode(snapshot.data),
              ),
            ],
          ),
        );
      },
    );
  }

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 30,
      padding: EdgeInsets.only(
        bottom: SizeConfig.safeBlockVertical * 4.5,
        left: SizeConfig.safeBlockHorizontal * 10,
        right: SizeConfig.safeBlockHorizontal * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _switchDarkMode(),
          _titleHome(),
          _search(),
        ],
      ),
    );
  }

  // ====================================================================
  // Change Theme (Dark - Light)
  // ====================================================================
  void _changeTheme(bool value) {
    widget.themeBloc.changeTheTheme(!value);
  }

  // ====================================================================
  // Icon Switch Dark Mode (iOS or Android)
  // ====================================================================
  Widget _iconSwitchDarkMode(bool darkMode) {
    if (Platform.isIOS) {
      return Icon(
        darkMode ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_fill,
        size: SizeConfig.safeBlockVertical * 4.5,
        color: Colors.white,
      );
    }

    return Icon(
      darkMode ? Icons.wb_sunny : Icons.nightlight_round,
      size: SizeConfig.safeBlockVertical * 4.5,
      color: Colors.white,
    );
  }

  // ====================================================================
  // Icon Search (iOS or Android)
  // ====================================================================
  Widget _iconSearch() {
    if (Platform.isIOS) return Icon(CupertinoIcons.search);

    return Icon(Icons.search);
  }
}
