class PersonCastModel {
  int _id, _order;
  String _name, _character, _profilePath;

  PersonCastModel({
    int id,
    int order,
    String name,
    String character,
    String profilePath,
  }) {
    this._id = id;
    this._order = order;
    this._name = name;
    this._character = character;
    this._profilePath = profilePath;
  }

  // =====================================================================
  // Json To Object
  // =====================================================================
  PersonCastModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _order = json["order"];
    _name = json["name"];
    _character = json["character"];
    _profilePath = json["profile_path"];
  }

  // =====================================================================
  // Setters
  // =====================================================================
  set id(int id) => this._id = id;
  set order(int order) => this._order = order;
  set name(String name) => this._name = name;
  set character(String character) => this._character = character;
  set profilePath(String profilePath) => this._profilePath = profilePath;

  // =====================================================================
  // Getters
  // =====================================================================
  int get id => _id;
  int get order => _order;
  String get name => _name;
  String get character => _character;
  String get profilePath => _profilePath;
}
