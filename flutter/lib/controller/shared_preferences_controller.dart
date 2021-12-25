import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  static Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? uid = prefs.getInt('UserId');
    return uid;
  }
  static setUserId(int uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('UserId', uid);
    print("userId set to $uid");
  }
}