import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/model/user_model.dart';


class PrefsService {
   late SharedPreferences preferences;

   init() async {
    preferences = await SharedPreferences.getInstance();
  }

   dynamic getData(String key){
    return preferences.get(key);
  }

   Future<bool> saveData(String key, dynamic value) async {
    if (value is String) {
      return preferences.setString(key, value);
    } else if (value is double) {
      return preferences.setDouble(key, value);
    } else if (value is bool) {
      return preferences.setBool(key, value);
    } else if (value is int) {
      return preferences.setInt(key, value);
    } else {
      return false;
    }
  }

  Future<bool> removeData(String key) async {
    return preferences.remove(key);
   }

   UserModel? loadUserData() {
     var jsonEncode = getData("userData");
     UserModel? userModel;
     if (jsonEncode != null) {
       Map<String, dynamic> map = json.decode(jsonEncode);
       userModel = UserModel.fromJson(map);
     }
     return userModel;
   }
}
