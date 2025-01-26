import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/services/injector_service.dart';
import '../../resources/app_constants.dart';
import 'global_states.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(InitialThemeState());

  void toggleTheme() {
    if (prefsService.getData(AppConstants.isDark) ?? true) {
      prefsService.saveData(AppConstants.isDark,false);
    } else {
      prefsService.saveData(AppConstants.isDark,true);
    }
    emit(ToggleThemeData());
  }

  bool isDarkTheme() {
    return prefsService.getData(AppConstants.isDark) ?? false;
  }

  void toggleLanguage(BuildContext context) {
    final currentLang = prefsService.getData(AppConstants.lang) ?? "ar";
    final newLang = currentLang == "ar" ? "en" : "ar";
    prefsService.saveData(AppConstants.lang, newLang);
    context.setLocale(Locale(newLang));
    emit(ToggleLanguageData());
  }

}


