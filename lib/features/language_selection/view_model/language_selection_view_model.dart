import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionViewModel extends ChangeNotifier {

  // languages code
  static const String ENGLISH = 'en';
  static const String HINDI = 'hi';

  Locale _locale = const Locale(ENGLISH, 'US');

  Locale get locale => _locale;

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _locale = const Locale(ENGLISH, 'US');
      return Null;
    }
    _locale = Locale(prefs.getString('langauge_code').toString(), prefs.getString('countryCode').toString());
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_locale == type) {
      return;
    }
    if (type == const Locale('hi')) {
      _locale = const Locale(HINDI, 'HI');
      await prefs.setString('language_code', 'hi');
      await prefs.setString('countryCode', 'HI');
    } else {
      _locale = const Locale(ENGLISH, 'US');
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}