// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/cache_manager.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class AuthenticationController extends GetxController with CacheManager {
  var isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    user = User();
    removeToken();
  }

  void login(User token) async {
    isLogged.value = true;
    user = token;
    await saveToken(user.id);
  }

  Future<void> checkLoginStatus() async {
    final token = await getToken();
    if (token != null) {
      user = (await userController.fetchUserById(token))!;
      isLogged.value = true;
      print("Remembered ${user.name}");
    }
  }
}
