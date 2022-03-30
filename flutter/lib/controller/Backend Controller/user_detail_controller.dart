// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/services/user_detail_remote_services.dart';

class UserDetailController extends GetxController {
  var isLoading = false.obs;
  List<UserDetail> userDetailList = <UserDetail>[].obs; //List<UserDetail>

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<void> fetchUserDetails() async {
    try {
      isLoading(true);
      List<UserDetail>? users =
          await UserDetailRemoteServices.fetchUserDetails();
      userDetailList.assignAll(users ?? []);
    } finally {
      isLoading(false);
    }
  }

  Future<UserDetail?> fetchUserDetailByUserId(userId) async {
    try {
      isLoading(true);
      UserDetail? detail =
          await UserDetailRemoteServices.fetchUserDetailByUserId(userId);
      if (detail != null) {
        ("fetch User Detail: user.id: " + detail.userId.toString());
      }
      return detail;
    } finally {
      isLoading(false);
    }
  }

  Future<int> addNewUserDetail({
    required UserDetail detail,
  }) async {
    try {
      isLoading(true);
      Map detailMap = detail.toJson();
      detailMap.remove("id");
      print(json.encode(detail).toString());
      var response = await UserDetailRemoteServices.addNewUserDetail(
          json.encode(detailMap).toString());
      print("Add New User Detail: " + response.toString() + "\n");
      //await fetchUserDetailByUserId(detail.userId);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int> updateUserDetail({
    required int id,
    required UserDetail userDetail,
  }) async {
    try {
      isLoading(true);
      print("Update User Detail ID: $id");
      Map<String, dynamic> detailMap = userDetail.toJson();
      detailMap.remove("tc_no");
      print(json.encode(detailMap).toString());
      var response = await UserDetailRemoteServices.updateUserDetail(
          id, json.encode(detailMap).toString());
      print("put User Detail: " + response.toString());
      //await fetchUserDetailByUserId(userDetail.userId);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetail(int id, userId) async {
    try {
      isLoading(true);
      print("Delete User Detail ID: $id");
      var response = await UserDetailRemoteServices.removeUserDetail(id);
      print("delete User Detail: " + response);
      fetchUserDetailByUserId(userId);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
