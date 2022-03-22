// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/services/user_detail_remote_services.dart';

class UserDetailController extends GetxController {
  var isLoading = false.obs;
  List<UserDetail> userDetailList = <UserDetail>[].obs; //List<UserDetail>

  Future<UserDetail?> fetchUserDetailByUserId(userId) async {
    try {
      isLoading(true);
      UserDetail? detail =
          await UserDetailServices.fetchUserDetailByUserId(userId);
      if (detail != null) {
        ("fetch User Detail: user.id: " + detail.userId.toString());
      }
      return detail;
    } finally {
      isLoading(false);
    }
  }

  Future<int> addNewUserDetail(UserDetail userDetail) async {
    try {
      isLoading(true);
      Map detail = userDetail.toJson();
      //detail.remove("id");
      print(json.encode(detail).toString());
      var response = await UserDetailServices.addNewUserDetail(
          json.encode(detail).toString());

      print("post User Detail: " + response.toString() + "\n");
      fetchUserDetailByUserId(userDetail.userId);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int> updateUserDetail(int id, UserDetail userDetail) async {
    print("User Detail Update");
    userDetail.id = id;
    print("User Detail $id : " + json.encode(userDetail.toJson()).toString());
    try {
      isLoading(true);
      Map<String, dynamic> detailMap = userDetail.toJson();
      //detailMap.remove("tc_no");
      print(json.encode(detailMap).toString());
      var response = await UserDetailServices.updateUserDetail(
          id, json.encode(detailMap).toString());
      print("put User Detail: " + response.toString());
      fetchUserDetailByUserId(userDetail.userId);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetail(int id, userId) async {
    try {
      isLoading(true);
      print("Delete User Detail ID: $id");
      var response = await UserDetailServices.deleteUserDetail(id);
      print("delete User Detail: " + response);
      fetchUserDetailByUserId(userId);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
