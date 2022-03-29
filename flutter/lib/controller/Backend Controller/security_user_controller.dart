import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/security_user.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/services/security_user_remote_services.dart';

//rebase git

class SecurityUserController extends GetxController {
  var isLoading = false.obs;

  Future<SecurityUser?> signIn(User user) async {
    try {
      isLoading(true);
      return await SecurityUserRemoteServices.signInSecurity(
          json.encode(user.toJson()).toString());
    } finally {
      isLoading(false);
    }
  }

  Future<int?> signUp(User user) async {
    try {
      isLoading(true);
      return await SecurityUserRemoteServices.signUpSecurity(
          json.encode(user.toJson()).toString());
    } finally {
      isLoading(false);
    }
  }

  Future<int> refreshToken(SecurityUser securityUser, String refToken) async {
    try {
      isLoading(true);
      return await SecurityUserRemoteServices.refreshTokenSecurity(
          json.encode(securityUser.toJson()).toString(), refToken);
    } finally {
      isLoading(false);
    }
  }
}
