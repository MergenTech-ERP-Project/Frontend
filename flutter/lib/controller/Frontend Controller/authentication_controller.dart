import 'package:get/get.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/cache_manager.dart';
import 'package:vtys_kalite/main.dart';

class AuthenticationController extends GetxController with CacheManager {
  var isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    user.name = "";
    removeToken();
  }

  void login(String token) async {
    isLogged.value = true;
    user.name = token;
    await saveToken(token);
  }

  void checkLoginStatus() async {
    final token = await getToken();
    if (token != null) {
      isLogged.value = true;
      user.name = token;
      print("Remembered $token");
    }
  }
}
