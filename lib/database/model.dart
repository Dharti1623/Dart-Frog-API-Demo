/// Model based on you table inside MySQL

class DatabaseModel {
  const DatabaseModel({
    this.id,
    this.name,
  });

  // fromJSON
  factory DatabaseModel.fromJson(Map<String, dynamic> json) {
    return DatabaseModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  // Create an DatabaseModel given a row.assoc() map
  factory DatabaseModel.fromRowAssoc(Map<String, String?> json) {
    return DatabaseModel(
      id: int.tryParse(json['id'].toString()) ,
      name: json['name'],
    );
  }

  // toJSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.toString(),
    };
  }

  final int? id;
  final String? name;
}
