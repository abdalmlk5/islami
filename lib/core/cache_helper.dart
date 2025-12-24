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

  static Future<bool> saveSurasList(int index) {
    List<String> surasList = getSurasList() ?? [];
    surasList.remove(index.toString());
    surasList.insert(0, index.toString());
    // another solution
    // surasList = surasList.toSet().toList();
    if (surasList.length > 5) {
      surasList.removeLast();
    }
    return pref.setStringList("surasList", surasList);
  }

  static List<String>? getSurasList() {
    return pref.getStringList("surasList");
  }
}
