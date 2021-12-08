import 'package:get/get.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/services/remote_services.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <User>[].obs; //List<User>

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var users = await RemoteServices.fetchProducts();
      if (users != null) {
        userList.value = users;
      }
    } finally {
      isLoading(false);
    }
  }
}
