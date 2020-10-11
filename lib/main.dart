import 'package:flutter/material.dart';

// Blocs
import 'package:prueba/blocs/theme_bloc.dart';

// Screens
import 'package:prueba/screens/home_screen.dart';

// Utilities
import 'package:prueba/app_config.dart';
import 'package:prueba/utils/hex_to_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeBloc.dispose();
    super.dispose();
  }

  // ====================================================================
  // Light Theme
  // ====================================================================
  ThemeData _lightTheme() {
    return ThemeData(
      brightness: Brightness.light,

      // Colors
      accentColor: Colors.black,
      scaffoldBackgroundColor: HexToColor(AppConfig.primaryColor),
      backgroundColor: Colors.white,
      unselectedWidgetColor: Colors.black38,

      // Fonts
      fontFamily: AppConfig.primaryFontFamily,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.w600,
          wordSpacing: 2,
          letterSpacing: 1,
        ),
        subtitle2: TextStyle(
          color: Colors.black54,
        ),
        bodyText1: TextStyle(
          color: Colors.black54,
          letterSpacing: 1.2,
          wordSpacing: 1.3,
        ),
      ),

      // Text Fields
      inputDecorationTheme: InputDecorationTheme(
        fillColor: HexToColor("#8DBDE0"),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        focusColor: HexToColor(AppConfig.backgroundLightColor),
      ),

      // Buttons
      buttonColor: HexToColor(AppConfig.primaryColor),

      // Others
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  // ====================================================================
  // Dark Theme
  // ====================================================================
  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,

      // Colors
      accentColor: Colors.white,
      scaffoldBackgroundColor: HexToColor(AppConfig.primaryColor),
      backgroundColor: HexToColor(AppConfig.backgroundDarkColor),
      unselectedWidgetColor: Colors.white30,

      // Fonts
      fontFamily: AppConfig.primaryFontFamily,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.w600,
          wordSpacing: 2,
          letterSpacing: 1,
        ),
        subtitle2: TextStyle(
          color: Colors.white60,
        ),
        bodyText1: TextStyle(
          color: Colors.white60,
          letterSpacing: 1,
          height: 1.6,
        ),
      ),

      // Text Fields
      inputDecorationTheme: InputDecorationTheme(
        fillColor: HexToColor("#8DBDE0"),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        focusColor: Colors.white,
      ),

      // Buttons
      buttonColor: HexToColor("#69727E"),

      // Others
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: true,
      stream: themeBloc.darkThemeIsEnabled,
      builder: (context, darkThemeIsEnabled) {
        return MaterialApp(
          title: 'Prueba Imaginamos',
          debugShowCheckedModeBanner: false,
          theme: darkThemeIsEnabled.data ? _darkTheme() : _lightTheme(),
          home: HomeScreen(),
        );
      },
    );
  }
}
