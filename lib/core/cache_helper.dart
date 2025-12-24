import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBool({required String key, required bool value}) {
    return pref.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return pref.getBool(key);
  }
}
