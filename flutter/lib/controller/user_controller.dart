import 'package:get/get.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/services/remote_services.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  List<User> userList = List.empty(growable: true); //List<User>

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await RemoteServices.fetchUsers();
      if (users != null) {
        userList = users;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<int> fetchUser(String name, String password) async {
    try {
      var user = await RemoteServices.fetchUser(name, password);
      return user;
    } finally {
    }
  }

  Future<String?> postUser(String name, String password) async {
    try {
      var response = await RemoteServices.postUser(User(id: 0,name: name, password: password, title: "Worker").toJson().toString());
      return response;
    } finally {
    }
  }
}
