import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Blocs
import 'package:prueba/blocs/theme_bloc.dart';

class TopCardHome extends StatefulWidget {
  TopCardHome({Key key}) : super(key: key);

  @override
  _TopCardHomeState createState() => _TopCardHomeState();
}

class _TopCardHomeState extends State<TopCardHome> {
  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 25,
      padding: EdgeInsets.only(
        bottom: SizeConfig.safeBlockVertical * 4,
        left: SizeConfig.safeBlockHorizontal * 14,
        right: SizeConfig.safeBlockHorizontal * 10,
        top: MediaQuery.of(context).padding.top,
      ),
      color: Theme.of(context).primaryColor,
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
  // Title Home
  // ====================================================================
  Widget _titleHome() {
    // Font Size Title (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 5.7;
    // Height Titlte (Responsive)
    double _heightSize = SizeConfig.safeBlockVertical * 0.19;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 3.9;
      _heightSize = SizeConfig.safeBlockVertical * .3;
    }

    return Container(
      child: Text(
        "Hello, what do you \nwant to watch ?",
        style: Theme.of(context).textTheme.headline1.merge(
              TextStyle(
                fontSize: _fontSize,
                height: _heightSize,
              ),
            ),
      ),
    );
  }

  // ====================================================================
  // Search
  // ====================================================================
  Widget _search() {
    // Height Container Search (Responsive)
    double _heightContainerSearch = SizeConfig.safeBlockVertical * 4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _heightContainerSearch = SizeConfig.safeBlockVertical * 9.4;
    }

    return Container(
      height: _heightContainerSearch,
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 2,
      ),
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
    // Height Container Icon Switch (Responsive)
    double _heightContainerIcon = SizeConfig.safeBlockVertical * 3.4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _heightContainerIcon = SizeConfig.safeBlockVertical * 9;
    }

    return StreamBuilder<bool>(
      initialData: true,
      stream: themeBloc.darkThemeIsEnabled,
      builder: (context, snapshot) {
        return Container(
          height: _heightContainerIcon,
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
  // Change Theme (Dark - Light)
  // ====================================================================
  void _changeTheme(bool value) {
    themeBloc.changeTheTheme(!value);
  }

  // ====================================================================
  // Icon Switch Dark Mode (iOS or Android)
  // ====================================================================
  Widget _iconSwitchDarkMode(bool darkMode) {
    // Size Icon Switch (Responsive)
    double _sizeIcon = SizeConfig.safeBlockVertical * 3.4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _sizeIcon = SizeConfig.safeBlockVertical * 9;
    }

    if (Platform.isIOS) {
      return Icon(
        darkMode ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_fill,
        size: _sizeIcon,
        color: Colors.white,
      );
    }

    return Icon(
      darkMode ? Icons.wb_sunny : Icons.nightlight_round,
      size: _sizeIcon,
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
