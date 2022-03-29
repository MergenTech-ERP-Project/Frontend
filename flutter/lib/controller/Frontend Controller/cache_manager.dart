import 'package:shared_preferences/shared_preferences.dart';

mixin CacheManager {
  Future<bool> saveToken(int userId, String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("user", userId);
    prefs.setString("accessToken", accessToken);
    return true;
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("user");
  }
  
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("accessToken");
  }

  Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("refreshToken");
  }

  Future<void> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  Future<void> removeAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");
  }

  Future<void> removeRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("refreshToken");
  }
}
