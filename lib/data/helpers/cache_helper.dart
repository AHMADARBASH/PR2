import 'package:shared_preferences/shared_preferences.dart';

class CachedData {
  static late SharedPreferences _prefrences;
  static Future init() async =>
      _prefrences = await SharedPreferences.getInstance();

  static bool containsKey({required String key}) {
    return _prefrences.containsKey(key);
  }

  static String getData(String key) {
    return _prefrences.getString(key) ?? "";
  }

  static void saveData(String key, dynamic data) {
    _prefrences.setString(key, data);
  }
}
