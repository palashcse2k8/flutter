import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code') ?? 'en');
    return Null;
  }

  void changeLanguage(Locale type) async {
    // debugPrint("Language Changed Called");
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("bn")) {
      _appLocale = const Locale("bn");
      await prefs.setString('language_code', 'bn');
      await prefs.setString('countryCode', 'BD');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }

    notifyListeners();
    // debugPrint("Language Changed");
  }
}
