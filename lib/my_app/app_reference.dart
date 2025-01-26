import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class AppReference {
  AppReference._();

  static final AppReference _instance = AppReference._();

  static AppReference get instance => _instance;

  static late bool deviceIsAndroid;
  static bool deviceIsTablet = false;
  static late bool deviceIsIos;
  //static late ThemeData themeData;
  static final deviceInfoPlugin = DeviceInfoPlugin();
  static Orientation currentOrientation(context) =>
      MediaQuery.of(context).orientation;

  static bool isPortrait(context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static double deviceHeight(context) => MediaQuery.sizeOf(context).height;

  static double deviceWidth(context) => MediaQuery.sizeOf(context).width;

  static void getDeviceInfo(BuildContext context) {
    final sizeMediaQuery = MediaQuery.sizeOf(context);
    //themeData = Theme.of(context);
    deviceIsAndroid = Platform.isAndroid;

    deviceIsIos = Platform.isIOS;
    final double devicePixelRatio = sizeMediaQuery.shortestSide;
    if (devicePixelRatio < 550) {
      deviceIsTablet = false;
    } else {
      deviceIsTablet = true;
    }
  }

  static Future<String> getMobileID() async {
    if (AppReference.deviceIsIos) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor!;
    } else if (AppReference.deviceIsAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else {
      return '';
    }
  }

  //get User Token
  static Future<String> getNotificationTokenFromFireBase() async {
    try {
        return await FirebaseMessaging.instance.getToken() ?? '';
    } catch (e) {
      return 'not found this Huawei Device  $e';
    }
  }

}


