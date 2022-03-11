// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/services/user_payment_remote_services.dart';

class UserDetailPaymentController extends GetxController {
  var isLoading = false.obs;
  List<UserDetailPayment> userListPayment = <UserDetailPayment>[].obs;

  Future<UserDetailPayment?> fetchUserDetailPaymentById(userDetailId) async {
    try {
      isLoading(true);
      UserDetailPayment? detailPayment =
          await UserDetailPaymentServices.fetchUserDetailPaymentById(userDetailId);
      print("fetch User Detail Payment: " + detailPayment!.tcno.toString());
      return detailPayment;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUserDetailPayment(
      userDetailId,
      UserDetailPayment userDetailPayment) async {
    try {
      isLoading(true);
      UserDetailPayment newUserDetailPayment =
          UserDetailPayment(userDetailId: userDetailId);
      var response = await UserDetailPaymentServices.addNewUserDetailPayment(
          json.encode(newUserDetailPayment.toJson()).toString());

      print("post User Detail Payment: " + response.toString());
      fetchUserDetailPaymentById(userDetailPayment.tcno);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateUserDetailPayment(
      int id, UserDetailPayment userDetailPayment) async {
    try {
      isLoading(true);
      print(id);
      var response = await UserDetailPaymentServices.updateUserDetailPayment(
          id, json.encode(userDetailPayment.toJson()).toString());
      print("put User Detail Payment: " + response);
      fetchUserDetailPaymentById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteUserDetailPayment(int id) async {
    try {
      isLoading(true);
      print(id);
      var response =
          await UserDetailPaymentServices.deleteUserDetailPayment(id);
      print("delete User Detail Payment: " + response);
      fetchUserDetailPaymentById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
