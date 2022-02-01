import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/services/user_remote_services.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  List<User> userList = <User>[].obs; //List<User>

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
      try {
        isLoading(true);
        var users = await UserRemoteServices.fetchUsers();
        if (users != null) {
          userList.removeRange(0, userList.length); //-1 belki
          userList.assignAll(users);
        }
      } finally {
        isLoading(false);
      }
  }

  Future<int> fetchUser(String name, String password) async {
    try {
      isLoading(true);
      var user = await UserRemoteServices.fetchUser(name, password);
      print("fetch User: " + user.toString());
      return user;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> postUser(String name, String password) async {
    try {
      isLoading(true);
      User newUser = User(id: 0,name: name, password: password, title: Departments.none);
      var response = await UserRemoteServices.postUser(json.encode(newUser.toJson()).toString());
      fetchUsers(); //userList.add(newUser);
      print("post User: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
  Future<String?> putUser(int id, User user) async {
    try {
      isLoading(true);
      print(id);
      var response = await UserRemoteServices.putUser(id, json.encode(user.toJsonWithId()).toString());
      fetchUsers(); //userList.add(newUser);
      print("put User: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUser(int id) async {
    try {
      isLoading(true);
      print(id);
      var response = await UserRemoteServices.deleteUser(id);
      fetchUsers(); //userList.add(newUser);
      print("delete User: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
