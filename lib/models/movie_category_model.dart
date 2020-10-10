enum TypeMovieCategory {
  topRated,
  trending,
  popular,
  upcoming,
}

class MovieCategoryModel {
  int _id;
  String _name;
  TypeMovieCategory _typeMovieCategory;

  MovieCategoryModel({
    int id,
    String name,
    TypeMovieCategory typeMovieCategory,
  }) {
    this._id = id;
    this._name = name;
    this._typeMovieCategory = typeMovieCategory;
  }

  // =====================================================================
  // Json To Object
  // =====================================================================
  MovieCategoryModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _name = json["name"];
    _typeMovieCategory = json["typeMovieCategory"];
  }

  // =====================================================================
  // Object To Json
  // =====================================================================
  Map<String, dynamic> toJson() => {
        "id": _id,
        "name": _name,
        "typeMovieCategory": _typeMovieCategory,
      };

  // =====================================================================
  // Setters
  // =====================================================================
  set id(int id) => this._id = id;
  set name(String name) => this._name = name;
  set typeMovieCategory(TypeMovieCategory typeMovieCategory) =>
      this._typeMovieCategory = typeMovieCategory;

  // =====================================================================
  // Getters
  // =====================================================================
  int get id => _id;
  String get name => _name;
  TypeMovieCategory get typeMovieCategory => this._typeMovieCategory;
}
