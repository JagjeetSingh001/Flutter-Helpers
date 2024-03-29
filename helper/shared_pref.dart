import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

const String selectedLang = "selectedLang";

Future setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(selectedLang, languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(selectedLang) ?? 'en';
  return Locale(languageCode);
}
