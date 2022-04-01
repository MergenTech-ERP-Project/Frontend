// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/security_user.dart';
import 'package:vtys_kalite/services/security_user_remote_services.dart';

//rebase git

class SecurityUserController extends GetxController {
  var isLoading = false.obs;

  Future<SecurityUser?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);
      Map userMap = {
        "email": email,
        "password": password,
      };
      var response = await SecurityUserRemoteServices.signIn(
          json.encode(userMap).toString());
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int?> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading(true);
      Map userMap = {
        "username": username,
        "email": email,
        "password": password,
      };
      var response = await SecurityUserRemoteServices.signUp(
          json.encode(userMap).toString());
      print("Signed by $username");
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<int> refreshToken(SecurityUser securityUser) async {
    try {
      isLoading(true);
      return await SecurityUserRemoteServices.refreshTokenSecurity(
        json.encode({'refreshToken': securityUser.refreshToken}).toString(),
      );
    } finally {
      isLoading(false);
    }
  }
}
