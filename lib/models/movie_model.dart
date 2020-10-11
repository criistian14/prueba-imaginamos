// Models
import 'package:prueba/models/genre_model.dart';
import 'package:prueba/models/person_cast_model.dart';
import 'package:prueba/models/production_company_model.dart';

class MovieModel {
  int _id, _voteAverage;
  String _title, _overview, _posterPath, _backdropPath;
  DateTime _releaseDate;
  List<GenreModel> _genres;
  List<ProductionCompanyModel> _productionCompanies;
  List<PersonCastModel> _peopleCast;

  MovieModel({
    int id,
    int voteAverage,
    String title,
    String overview,
    String posterPath,
    String backdropPath,
    DateTime releaseDate,
    List<GenreModel> genres,
    List<ProductionCompanyModel> productionCompanies,
    List<PersonCastModel> peopleCast,
  }) {
    this._id = id;
    this._title = title;
    this._overview = overview;
    this._posterPath = posterPath;
    this._backdropPath = backdropPath;
    this._voteAverage = voteAverage;
    this._releaseDate = releaseDate;
    this._genres = genres;
    this._productionCompanies = productionCompanies;
    this._peopleCast = peopleCast;
  }

  // =====================================================================
  // Json To Object
  // =====================================================================
  MovieModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _title = json["title"];
    _overview = json["overview"];
    _posterPath = json["poster_path"];
    _backdropPath = json["backdrop_path"];
    _releaseDate = DateTime.parse(json["release_date"]) ?? null;

    // Load Genres
    if (json['genres'] != null) {
      var _genresList = json['genres'] as List;
      _genres = List<GenreModel>();

      for (var i = 0; i < _genresList.length; i++) {
        _genres.add(GenreModel.fromJson(
          _genresList[i],
        ));
      }
    }

    // Load Production Companies
    if (json["production_companies"] != null) {
      var _productionCompaniesList = json['production_companies'] as List;
      _productionCompanies = List<ProductionCompanyModel>();

      for (var i = 0; i < _productionCompaniesList.length; i++) {
        _productionCompanies.add(ProductionCompanyModel.fromJson(
          _productionCompaniesList[i],
        ));
      }
    }

    // Load People Cast
    if (json["cast"] != null) {
      var _peopleCastList = json["cast"] as List;
      _peopleCast = List<PersonCastModel>();

      for (var i = 0; i < _peopleCastList.length; i++) {
        _peopleCast.add(PersonCastModel.fromJson(
          _peopleCastList[i],
        ));
      }
    }

    // Vote Average to 5 stars
    _voteAverage =
        json["vote_average"] != null ? (json["vote_average"] / 2).round() : 0;
  }

  // =====================================================================
  // Setters
  // =====================================================================
  set id(int id) => this._id = id;
  set title(String title) => this._title = title;
  set overview(String overview) => this._overview = overview;
  set posterPath(String posterPath) => this._posterPath = posterPath;
  set backdropPath(String backdropPath) => this._backdropPath = backdropPath;
  set voteAverage(int voteAverage) => this._voteAverage = voteAverage;
  set releaseDate(DateTime releaseDate) => this._releaseDate = releaseDate;
  set genres(List<GenreModel> genres) => this._genres = genres;
  set productionCompanies(List<ProductionCompanyModel> productionCompanies) =>
      this._productionCompanies = productionCompanies;
  set peopleCast(List<PersonCastModel> peopleCast) =>
      this._peopleCast = peopleCast;

  // =====================================================================
  // Getters
  // =====================================================================
  int get id => _id;
  String get title => _title;
  String get overview => _overview;
  String get posterPath => _posterPath;
  String get backdropPath => _backdropPath;
  int get voteAverage => _voteAverage;
  DateTime get releaseDate => _releaseDate;
  List<GenreModel> get genres => _genres;
  List<ProductionCompanyModel> get productionCompanies => _productionCompanies;
  List<PersonCastModel> get peopleCast => _peopleCast;

  // List to string with names of production companies
  String get productionCompaniesFormat {
    if (_productionCompanies == null) return "";

    String format = "";

    for (var i = 0; i < _productionCompanies.length; i++) {
      format += _productionCompanies[i].name;

      if (i != (_productionCompanies.length - 1)) {
        format += ", ";
      }
    }

    return format;
  }

  // List to string with names of genres
  String get genresFormat {
    if (_genres == null) return "";

    String format = "";

    for (var i = 0; i < _genres.length; i++) {
      format += _genres[i].name;

      if (i != (_genres.length - 1)) {
        format += ", ";
      }
    }

    return format;
  }
}
