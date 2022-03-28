// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/services/user_remote_services.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  List<User> userList = <User>[].obs; //List<User>

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
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
      int userId =
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
      return await UserRemoteServices.fetchUserById(id);
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

  Future<int> addNewUser({
    required User user,
  }) async {
    try {
      isLoading(true);
      Map userMap = user.toJson();
      userMap.remove('id');
      int response =
          await UserRemoteServices.addNewUser(json.encode(userMap).toString());
      print("Add New User $response");
      await fetchUsers();
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int> updateUser({
    required int id,
    required User user,
  }) async {
    try {
      isLoading(true);
      print("Update User ID: $id");
      int response = await UserRemoteServices.updateUser(
          id, json.encode(user.toJson()).toString());
      print("put User: $response");
      await fetchUsers();
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int> deleteUser(int id) async {
    try {
      isLoading(true);
      print("Delete User ID: $id");
      var response = await UserRemoteServices.deleteUser(id);
      await fetchUsers(); //userList.add(newUser);
      print("delete User: $response");
      return response;
    } finally {
      isLoading(false);
    }
  }
}
