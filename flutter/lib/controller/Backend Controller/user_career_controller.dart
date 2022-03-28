// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/services/user_career_remote_services.dart';

class UserDetailCareerController extends GetxController {
  var isLoading = false.obs;
  List<UserDetailCareer> userListCareer = <UserDetailCareer>[].obs;

  Future<UserDetailCareer?> fetchUserDetailCareerById(userDetailId) async {
    try {
      isLoading(true);
      return await UserDetailCareerServices.fetchUserDetailCareerById(
        userDetailId,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUserDetailCareer({
    required UserDetailCareer career,
  }) async {
    try {
      isLoading(true);
      var response = await UserDetailCareerServices.addNewUserDetailCareer(
          json.encode(career.toJson()).toString());

      print("post User Detail Career: " + response.toString());
      //await fetchUserDetailCareerById(career.id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> updateUserDetailCareer({
    required int id,
    required UserDetailCareer career,
  }) async {
    try {
      isLoading(true);
      print("put User Detail Career ID: $id");
      var response = await UserDetailCareerServices.updateUserDetailCareer(
          id, json.encode(career.toJson()).toString());
      print("put User Detail Career: " + response.toString());
      //await fetchUserDetailCareerById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetailCareer(int id) async {
    try {
      isLoading(true);
      print("Delete User Detail Career ID: $id");
      var response = await UserDetailCareerServices.deleteUserDetailCareers(id);
      print("delete User Detail Career: " + response);
      await fetchUserDetailCareerById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
