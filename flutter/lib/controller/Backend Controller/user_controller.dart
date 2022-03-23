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

  Future<int> addNewUser({
    required User newUser,
    required String tcNo,
    UserDetail? userDetail,
  }) async {
    try {
      isLoading(true);
      int response = await UserRemoteServices.addNewUser(
          json.encode(newUser.toJson()).toString());
      print("addNewUser $response");
      await fetchUsers(); //userList.add(newUser);
      var userId = await userController.fetchUserByEmailAndPassword(
          newUser.email, newUser.password);
      if (userDetail != null) {
        userDetail.userId = userId;
      }
      response = await userDetailController.addNewUserDetail(
        userDetail ?? UserDetail(userId: userId, tcno: tcNo),
      );
      print("addNewUserDetail $response");
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateUser({
    required int id,
    required User user,
    UserDetail? userDetail,
  }) async {
    try {
      isLoading(true);
      print("Update User ID: $id");
      var response = await UserRemoteServices.updateUser(
          id, json.encode(user.toJson()).toString());
      print("put User: " + response);
      await fetchUsers(); //userList.add(newUser);
      if (userDetail != null) {
        UserDetail? findUserDetail =
            await userDetailController.fetchUserDetailByUserId(user.id);
        print("findUserDetail : " +
            (findUserDetail != null
                ? findUserDetail.toJson().toString()
                : "null"));
        userDetail.userId = user.id;
        findUserDetail == null
            ? await userDetailController.addNewUserDetail(userDetail)
            : await userDetailController.updateUserDetail(
                findUserDetail.id, userDetail);
      }
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
      await fetchUsers(); //userList.add(newUser);
      print("delete User: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
