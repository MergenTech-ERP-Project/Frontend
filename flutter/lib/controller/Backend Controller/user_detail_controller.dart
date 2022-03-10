// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/services/user_detail_remote_services.dart';

class UserDetailController extends GetxController {
  var isLoading = false.obs;
  List<UserDetail> userDetailList = <UserDetail>[].obs; //List<UserDetail>

  Future<UserDetail?> fetchUserDetailById(userId) async {
    try {
      isLoading(true);
      UserDetail? detail = await UserDetailServices.fetchUserDetailById(userId);
      print("fetch User Detail: " + detail!.userId.toString());
      return detail;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUserDetail(UserDetail userDetail) async {
    try {
      isLoading(true);
      var response = await UserDetailServices.addNewUserDetail(
          json.encode(userDetail.toJson()).toString());

      print("post User Detail: " + response.toString());
      fetchUserDetailById(userDetail.userId);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateUserDetail(int id, UserDetail userDetail) async {
    try {
      isLoading(true);
      print(id);
      var response = await UserDetailServices.updateUserDetail(
          id, json.encode(userDetail.toJson()).toString());
      print("put User Detail: " + response);
      fetchUserDetailById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetail(int id) async {
    try {
      isLoading(true);
      print(id);
      var response = await UserDetailServices.deleteUserDetail(id);
      print("delete User Detail: " + response);
      fetchUserDetailById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
