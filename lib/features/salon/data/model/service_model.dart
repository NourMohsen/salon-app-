class ServiceModel {
  int? id;
  String? name;
  String? image;

  ServiceModel(
      {this.id,
        this.name,
       });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];

  }

}

