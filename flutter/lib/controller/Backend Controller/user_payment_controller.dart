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
      return await UserDetailPaymentServices.fetchUserDetailPaymentById(
          userDetailId);
    } finally {
      isLoading(false);
    }
  }

  Future<int?> addNewUserDetailPayment({
    required UserDetailPayment payment,
  }) async {
    try {
      isLoading(true);
      return await UserDetailPaymentServices.addNewUserDetailPayment(
          json.encode(payment.toJson()).toString());
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateUserDetailPayment({
    required int id,
    required UserDetailPayment payment,
  }) async {
    try {
      isLoading(true);
      print("Update User Detail Payment ID: $id");
      var response = await UserDetailPaymentServices.updateUserDetailPayment(
          id, json.encode(payment.toJson()).toString());
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
          await UserDetailPaymentServices.removeUserDetailPayment(id);
      print("delete User Detail Payment: " + response);
      fetchUserDetailPaymentById(id);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
