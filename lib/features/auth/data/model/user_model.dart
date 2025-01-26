class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? deviceId;
  String? firebaseToken;
  String? gender;
  int? cityId;
  String? cityName;


  UserModel(
      {this.id,
       this.name,
        this.email,
        this.phone,
        this.firebaseToken,
        this.gender,
        this.cityId,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['Phone'];
    gender = json['gender'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    if(firebaseToken != null) {
      data['token_firebase'] = firebaseToken;
    }
    if(deviceId != null) {
      data['device_id'] = deviceId;
    }
    data['gender'] = gender;
    data['city_id'] = cityId;
    data['avatar'] = avatar;
    return data;
  }

}
