// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
import 'package:vtys_kalite/services/user_detail_vacation_remote_service.dart';

class UserDetailVacationController extends GetxController {
  var isLoading = false.obs;
  List<UserDetailVacation> vacationList = <UserDetailVacation>[].obs;

  Future<UserDetailVacation?> fetchUserDetailVacationByUserDetailId(
      userDetailId) async {
    try {
      isLoading(true);
      UserDetailVacation? vacation = await UserDetailVacationServices
          .fetchUserDetailVacationByUserDetailId(userDetailId);
      print("fetch User Detail Vacation: " + vacation!.userDetailId.toString());
      return vacation;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUserDetailVacation(
      userDetailId, UserDetailVacation userDetailVacation) async {
    try {
      isLoading(true);
      UserDetailVacation newUserDetailVacation =
          UserDetailVacation(userDetailId: userDetailId);
      var response = await UserDetailVacationServices.addNewUserDetailVacation(
          json.encode(newUserDetailVacation.toJson()).toString());

      print("post User Detail Vacation: " + response.toString());
      fetchUserDetailVacationByUserDetailId(userDetailVacation.id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> updateUserDetailCareer(
      int id, UserDetailVacation userDetailVacation) async {
    try {
      isLoading(true);
      print("put User Detail Vacation ID: $id");
      var response = await UserDetailVacationServices.updateUserDetailVacation(
          id, json.encode(userDetailVacation.toJson()).toString());
      print("put User Detail Vacation: " + response.toString());
      fetchUserDetailVacationByUserDetailId(id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetailCareer(int id) async {
    try {
      isLoading(true);
      print("Delete User Detail Vacation ID: $id");
      var response =
          await UserDetailVacationServices.deleteUserDetailVacation(id);
      print("delete User Detail Vacation: " + response);
      fetchUserDetailVacationByUserDetailId(id);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
