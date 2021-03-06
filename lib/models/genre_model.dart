class GenreModel {
  int _id;
  String _name;

  GenreModel({
    int id,
    String name,
  }) {
    this._id = id;
    this._name = name;
  }

  // =====================================================================
  // Json To Object
  // =====================================================================
  GenreModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _name = json["name"];
  }

  // =====================================================================
  // Setters
  // =====================================================================
  set id(int id) => this._id = id;
  set name(String name) => this._name = name;

  // =====================================================================
  // Getters
  // =====================================================================
  int get id => _id;
  String get name => _name;
}
