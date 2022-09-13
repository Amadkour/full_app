import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../modules/dashboard/modules/setting/controller/settings_cubit.dart';
abstract class Config {
  static Map localization = {};

  static loadLanguage(String lang) async {
    String translation;
    if (lang == 'ar') {
      translation = await rootBundle.loadString('assets/localization/ar.json');
    } else {
      translation = await rootBundle.loadString('assets/localization/en.json');
    }
    localization = jsonDecode(translation);
  }
}

final gt=GetIt.instance;


initGetIt(){
  gt.registerSingleton(SettingsCubit());
}











