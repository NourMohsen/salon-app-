import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'config/resources/app_constants.dart';
import 'core/localization/codegen_loader.g.dart';
import 'core/services/injector_service.dart';
import 'firebase_options.dart';
import 'my_app/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  prefsService.init();
  runApp(EasyLocalization(
      supportedLocales: AppConstants.supportedLocales,
      path: AppConstants.localizationPath,
      fallbackLocale: AppConstants.fallbackLocale,
      startLocale: AppConstants.startLocale,
       assetLoader: const CodegenLoader(),
      saveLocale: true,
      child: MyApp()
  ),);
}

