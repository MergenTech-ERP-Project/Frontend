// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/services/user_detail_remote_services.dart';

class UserDetailController extends GetxController {
  var isLoading = false.obs;
  List<UserDetail> userList = <UserDetail>[].obs; //List<UserDetail>

  Future<UserDetail?> fetchUserDetailByTCNO(tcno) async {
    try {
      isLoading(true);
      UserDetail? detail = await UserDetailServices.fetchUserDetailByTCNO(tcno);
      print("fetch User Detail: " + detail!.tcno.toString());
      return detail;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUserDetail(UserDetail userDetail) async {
    try {
      isLoading(true);
      UserDetail newUserDetail = UserDetail();
      var response = await UserDetailServices.addNewUserDetail(
          json.encode(newUserDetail.toJson()).toString());

      print("post User Detail: " + response.toString());
      fetchUserDetailByTCNO(userDetail.tcno);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateUserDetail(String tcno, UserDetail userDetail) async {
    try {
      isLoading(true);
      print(tcno);
      var response = await UserDetailServices.updateUserDetail(
          tcno, json.encode(userDetail.toJson()).toString());
      print("put User Detail: " + response);
      fetchUserDetailByTCNO(tcno);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetail(String tcno) async {
    try {
      isLoading(true);
      print(tcno);
      var response = await UserDetailServices.deleteUserDetail(tcno);
      print("delete User Detail: " + response);
      fetchUserDetailByTCNO(tcno);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
