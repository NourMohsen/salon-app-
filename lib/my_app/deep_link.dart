import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import '../config/routes/routes_names.dart';
import '../features/auth/auth.dart';
import 'my_app.dart';

class DeepLinkManager {
  DeepLinkManager._privateConstructor();

  static final DeepLinkManager _instance =
      DeepLinkManager._privateConstructor();

  static DeepLinkManager get instance => _instance;

  late AppLinks _appLinks;
  void initDeepLink() async {
    _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen((Uri uri) {
      if (uri.path.isNotEmpty) {
        var isService = uri.path.contains('salon-details');
        if (isService) {
          var serviceId = uri.path.split('/salon-details/')[1];
          if (serviceId.isNotEmpty) {
            navigatorKey.currentState!.pushReplacementNamed(AppRoutesNames.rSalonDetailsScreen,arguments: serviceId);
          }
        }else {
          navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen()));
        }
      }
    });
  }
}

