import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_template/core/localization/lanaguages_enum.dart';
import 'package:project_template/core/localization/language_local_storage.dart';

class AppLanguage extends GetxController {
  var appLocale = Languages.en.name;
  @override
  void onInit() async {
    super.onInit();
    LocalStorage localStorage = LocalStorage();
    appLocale = await localStorage.getSelectedLanguage;
    Get.updateLocale(Locale(appLocale));
    update();
  }

  void changeLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();
    if (appLocale == type) {
      return;
    } else if (type == Languages.ar.name) {
      appLocale = Languages.ar.name;
      localStorage.saveLanguageToDisck(Languages.ar.name);
    } else {
      appLocale = Languages.en.name;
      localStorage.saveLanguageToDisck(Languages.en.name);
    }
    update();
  }
}
