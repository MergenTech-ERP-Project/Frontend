// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/cache_manager.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/user.dart';

class AuthenticationController extends GetxController with CacheManager {
  var isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    user = User();
    removeToken();
  }

  void login(User token) async {
    isLogged.value = true;
    var users = <User>[];
    users.add(token);
    user = token;
    await saveToken(fetchUsers(users));
  }

  void checkLoginStatus() async {
    final token = await getToken();
    if (token != null) {
      isLogged.value = true;
      user = parseUser(token);
      print("Remembered ${user.name}");
    }
  }
}
