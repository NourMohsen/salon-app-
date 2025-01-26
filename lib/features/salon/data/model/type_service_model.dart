class TypeServiceModel {
  int? id;
  String? name;

  TypeServiceModel({this.id, this.name});

  TypeServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}