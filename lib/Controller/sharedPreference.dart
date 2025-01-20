

import 'package:shared_preferences/shared_preferences.dart';


abstract Class SharePreference
{

  getBool({required String key, required bool value,}) async {
  final prefes = await SharedPreferences.getInstance();
  return prefes.setBool(key, value);
}


Future<bool> setBool(String key) async {
  final prefes = await SharedPreferences.getInstance();
  return prefes.getBool(key) ?? false;
}

}