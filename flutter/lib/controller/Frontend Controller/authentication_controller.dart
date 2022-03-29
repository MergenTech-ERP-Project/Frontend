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
    removeUserId();
    removeAccessToken();
  }

  void login(User user) async {
    isLogged.value = true;
    await saveToken(
      user.id,
      securityUser.accessToken,
    );
  }

  Future<void> checkLoginStatus() async {
    final userId = await getUserId();
    if (userId != null) {
      user = (await userController.fetchUserById(userId))!;
  
      isLogged.value = true;
      print("Remembered for login${user.name}");
    }
  }
}
