class LoginModel {
  String? token;
  bool? firstLogin;

  LoginModel(
      {this.token,
       this.firstLogin,
      });

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    firstLogin = json['first_login'];
  }

}
