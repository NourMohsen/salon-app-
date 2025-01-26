class ProviderModel {
  int? id;
  String? name;
  String? avatar;
  String? nationality;
  String? rateAvg;

  ProviderModel({this.id, this.name, this.avatar, this.nationality, this.rateAvg});

  ProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    nationality = json['nationality'];
    rateAvg = json['rate_avg'];
  }

}