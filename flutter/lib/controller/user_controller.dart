import 'dart:convert';

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
      print("fetch User: " + user.toString());
      return user;
    } finally {
    }
  }

  Future<String?> postUser(String name, String password) async {
    try {
      var response = await RemoteServices.postUser(json.encode(User(id: 0,name: name, password: password, title: "Worker").toJson()).toString());
      print("post User: " + response);
      return response;
    } finally {
    }
  }
}
