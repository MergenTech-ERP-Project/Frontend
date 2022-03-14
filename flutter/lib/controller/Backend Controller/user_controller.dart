// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/services/user_remote_services.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  List<User> userList = <User>[].obs; //List<User>

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      List<User>? users = await UserRemoteServices.fetchUsers();
      userList.assignAll(users ?? []);
    } finally {
      isLoading(false);
    }
  }

  Future<int> fetchUserByEmailAndPassword(String email, String password) async {
    try {
      isLoading(true);
      var userId =
          await UserRemoteServices.fetchUserByEmailAndPassword(email, password);
      print("fetch User: " + userId.toString());
      return userId;
    } finally {
      isLoading(false);
    }
  }

  Future<User?> fetchUserById(id) async {
    try {
      isLoading(true);
      User? user = await UserRemoteServices.fetchUserById(id);
      if (user != null) print("fetch User: " + user.id.toString());
      return user;
    } finally {
      isLoading(false);
    }
  }

  Future<int> fetchUserByName(String name) async {
    try {
      isLoading(true);
      var userId = await UserRemoteServices.fetchUserByName(name);
      print("fetch User: " + userId.toString());
      return userId;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUser(String name, String email, String password,
      String cellPhoneNumber) async {
    try {
      isLoading(true);
      User newUser = User(
        id: 0,
        name: name,
        password: password,
        title: "",
        // name == "admin" ? DepartmentsEnum.management : DepartmentsEnum.none,
        cellphone: cellPhoneNumber,
        email: email,
      );
      var response = await UserRemoteServices.addNewUser(
          json.encode(newUser.toJson()).toString());
      fetchUsers(); //userList.add(newUser);
      print("post User: " + response.toString());
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateUser(int id, User user) async {
    try {
      isLoading(true);
      print("Update User ID: $id");
      var response = await UserRemoteServices.updateUser(
          id, json.encode(user.toJson()).toString());
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
      print("Delete User ID: $id");
      var response = await UserRemoteServices.deleteUser(id);
      fetchUsers(); //userList.add(newUser);
      print("delete User: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
