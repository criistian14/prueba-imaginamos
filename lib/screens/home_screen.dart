import 'package:flutter/material.dart';

// Utilities
import 'package:prueba/utils/size_config.dart';

// Widgets
import 'package:prueba/widgets/home/app_bar.dart';
import 'package:prueba/widgets/home/movie_category.dart';

// Blocs
import 'package:prueba/blocs/theme_bloc.dart';

// Models
import 'package:prueba/models/movie_category_model.dart';

class HomeScreen extends StatefulWidget {
  final ThemeBloc themeBloc;

  HomeScreen({Key key, @required this.themeBloc}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _movieCategories = List<MovieCategoryModel>();

  @override
  void initState() {
    super.initState();

    _addMovieCategories();
  }

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar With Search
              AppBarHome(themeBloc: widget.themeBloc),

              // List Movies
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return MovieCategory(
                      index: index,
                      movieCategory: _movieCategories[index],
                    );
                  },
                  childCount: _movieCategories.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ====================================================================
  // Add Movie Categories
  // ====================================================================
  void _addMovieCategories() {
    _movieCategories.add(MovieCategoryModel(
      typeMovieCategory: TypeMovieCategory.topRated,
      name: "Top Rated",
    ));

    _movieCategories.add(MovieCategoryModel(
      typeMovieCategory: TypeMovieCategory.trending,
      name: "Trending",
    ));

    _movieCategories.add(MovieCategoryModel(
      typeMovieCategory: TypeMovieCategory.popular,
      name: "Popular",
    ));

    _movieCategories.add(MovieCategoryModel(
      typeMovieCategory: TypeMovieCategory.upcoming,
      name: "Upcoming",
    ));
  }
}
