// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/services/user_career_remote_services.dart';

class UserDetailCareerController extends GetxController {
  var isLoading = false.obs;
  List<UserDetailCareer> userListCareer = <UserDetailCareer>[].obs;

  Future<UserDetailCareer?> fetchUserDetailCareerById(id) async {
    try {
      isLoading(true);
      UserDetailCareer? detailCareer =
          await UserDetailCareerServices.fetchUserDetailCareerById(id);
      print("fetch User Detail Career: " + detailCareer!.id.toString());
      return detailCareer;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUserDetailCareer(
      userDetailId, UserDetailCareer userDetailCareer) async {
    try {
      isLoading(true);
      UserDetailCareer newUserDetailCareer =
          UserDetailCareer(userDetailId: userDetailId);
      var response = await UserDetailCareerServices.addNewUserDetailCareer(
          json.encode(newUserDetailCareer.toJson()).toString());

      print("post User Detail Career: " + response.toString());
      fetchUserDetailCareerById(userDetailCareer.id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> updateUserDetailCareer(
      int id, UserDetailCareer userDetailCareer) async {
    try {
      isLoading(true);
      print(id);
      var response = await UserDetailCareerServices.updateUserDetailCareer(
          id, json.encode(userDetailCareer.toJson()).toString());
      print("put User Detail Career: " + response.toString());
      fetchUserDetailCareerById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetailCareer(int id) async {
    try {
      isLoading(true);
      print(id);
      var response = await UserDetailCareerServices.deleteUserDetailCareers(id);
      print("delete User Detail Career: " + response);
      fetchUserDetailCareerById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
