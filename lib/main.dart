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
  ThemeBloc themeBloc = ThemeBloc();

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
      accentColor: Colors.black,
      fontFamily: AppConfig.primaryFontFamily,
      scaffoldBackgroundColor: HexToColor(AppConfig.primaryColor),
      backgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: HexToColor("#8DBDE0"),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        focusColor: HexToColor(AppConfig.backgroundLightColor),
      ),
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
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  // ====================================================================
  // Dark Theme
  // ====================================================================
  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.white,
      fontFamily: AppConfig.primaryFontFamily,
      scaffoldBackgroundColor: HexToColor(AppConfig.primaryColor),
      backgroundColor: HexToColor(AppConfig.backgroundDarkColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: HexToColor("#8DBDE0"),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        focusColor: Colors.white,
      ),
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
      ),
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
          home: HomeScreen(
            themeBloc: themeBloc,
          ),
        );
      },
    );
  }
}
