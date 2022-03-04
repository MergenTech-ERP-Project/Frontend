import 'package:shared_preferences/shared_preferences.dart';

mixin CacheManager {
  Future<bool> saveToken(int token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("user", token);
    return true;
  }

  Future<int?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("user");
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }
}
