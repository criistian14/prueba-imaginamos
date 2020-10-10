// Models
import 'package:prueba/models/genre_model.dart';
import 'package:prueba/models/production_company_model.dart';

class MovieModel {
  int _id, _voteAverage;
  String _title, _overview, _posterPath;
  DateTime _releaseDate;
  List<GenreModel> _genres;
  List<ProductionCompanyModel> _productionCompanies;

  MovieModel({
    int id,
    int voteAverage,
    String title,
    String overview,
    String posterPath,
    DateTime releaseDate,
    List<GenreModel> genres,
    List<ProductionCompanyModel> productionCompanies,
  }) {
    this._id = id;
    this._title = title;
    this._overview = overview;
    this._posterPath = posterPath;
    this._voteAverage = voteAverage;
    this._releaseDate = releaseDate;
    this._genres = genres;
    this._productionCompanies = productionCompanies;
  }

  // =====================================================================
  // Json To Object
  // =====================================================================
  MovieModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _title = json["title"];
    _overview = json["overview"];
    _posterPath = json["poster_path"];
    _releaseDate = DateTime.parse(json["release_date"]) ?? null;

    // Load Genres
    if (json['genres'] != null) {
      var _genresList = json['genres'] as List;
      _genres = List<GenreModel>();

      for (var i = 0; i < _genresList.length; i++) {
        _genres.add(GenreModel.fromJson(_genresList[i]));
      }
    }

    // Load Production Companies
    if (json["production_companies"] != null) {
      var _genresList = json['production_companies'] as List;
      _productionCompanies = List<ProductionCompanyModel>();

      for (var i = 0; i < _genresList.length; i++) {
        _productionCompanies
            .add(ProductionCompanyModel.fromJson(_genresList[i]));
      }
    }

    // Vote Average to 5 stars
    _voteAverage =
        json["vote_average"] != null ? (json["vote_average"] / 2).round() : 0;
  }

  // =====================================================================
  // Object To Json
  // =====================================================================
  Map<String, dynamic> toJson() => {
        "id": _id,
        "title": _title,
        "overview": _overview,
        "poster_path": _posterPath,
        "vote_average": _voteAverage,
        "release_date": _releaseDate,
        "genres": _genres,
        "production_companies": _productionCompanies,
      };

  // =====================================================================
  // Setters
  // =====================================================================
  set id(int id) => this._id = id;
  set title(String title) => this._title = title;
  set overview(String overview) => this._overview = overview;
  set posterPath(String posterPath) => this._posterPath = posterPath;
  set voteAverage(int voteAverage) => this._voteAverage = voteAverage;
  set releaseDate(DateTime releaseDate) => this._releaseDate = releaseDate;
  set genres(List<GenreModel> genres) => this._genres = genres;
  set productionCompanies(List<ProductionCompanyModel> productionCompanies) =>
      this._productionCompanies = productionCompanies;

  // =====================================================================
  // Getters
  // =====================================================================
  int get id => _id;
  String get title => _title;
  String get overview => _overview;
  String get posterPath => _posterPath;
  int get voteAverage => _voteAverage;
  DateTime get releaseDate => _releaseDate;
  List<GenreModel> get genres => _genres;
  List<ProductionCompanyModel> get productionCompanies => _productionCompanies;
}
