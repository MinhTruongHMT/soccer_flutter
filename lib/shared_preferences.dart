import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? _sharedpreferences;

  static Future init() async {
    _sharedpreferences = await SharedPreferences.getInstance();
  }

  static void setKey(String key, String value) {
    _sharedpreferences?.setString(key, value);
  }

  static String? getString(String key) {
    return _sharedpreferences?.getString(key);
  }
}
