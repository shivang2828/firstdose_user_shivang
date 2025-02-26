import 'package:shared_preferences/shared_preferences.dart';

abstract class Preference {
  static Future<String?> getSharedPref(String key) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    return sharedPref.getString(key);
  }

  static Future<bool> getSharedPrefBool(String key) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool(key)!;
  }

  static saveSharedPrefString(String key, String value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(key, value);
  }

  static saveSharedPrefBool(String key, bool value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(key, value);
  }

  static clearPrefData() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
  }

  static removePrefKey(String removeKey) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(removeKey);
  }
}
