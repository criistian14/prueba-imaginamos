class ProductionCompanyModel {
  int _id;
  String _name;

  ProductionCompanyModel({
    int id,
    String name,
  }) {
    this._id = id;
    this._name = name;
  }

  // =====================================================================
  // Json To Object
  // =====================================================================
  ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _name = json["name"];
  }

  // =====================================================================
  // Object To Json
  // =====================================================================
  Map<String, dynamic> toJson() => {
        "id": _id,
        "name": _name,
      };

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
