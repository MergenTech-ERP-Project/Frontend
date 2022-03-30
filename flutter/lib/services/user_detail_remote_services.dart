// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserDetailRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<UserDetail>?> fetchUserDetails() async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/user/list'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("fetchUserDetails " + response.body);
      return parseUsersDetail(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchUserDetails();
    } else {
      return null;
    }
  }

  static Future<UserDetail?> fetchUserDetailByUserId(userId) async {
    var response = await http.get(
        Uri.parse(serviceHttp + '/userdetail/find/userid:$userId'),
        headers: {
          'Authorization':
              '${securityUser.tokenType} ${securityUser.accessToken}',
        });
    UserDetail? userDetail;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      userDetail = parseUserDetail(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchUserDetailByUserId(userId);
    } else {
      return userDetail;
    }
    return userDetail;
  }

  static Future<int> addNewUserDetail(String json) async {
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/userdetail/new'),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization':
                '${securityUser.tokenType} ${securityUser.accessToken}',
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        )
        .onError(
      (error, stackTrace) {
        throw error.toString();
      },
    );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return addNewUserDetail(json);
    }
    return response.statusCode;
  }

  static Future<int> updateUserDetail(int id, String json) async {
    var response = await http
        .put(Uri.parse(serviceHttp + '/userdetail/update/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  '${securityUser.tokenType} ${securityUser.accessToken}',
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        )
        .onError(
      (error, stackTrace) {
        throw error.toString();
      },
    );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return updateUserDetail(id, json);
    }
    return response.statusCode;
  }

  static Future<String> removeUserDetail(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/userdetail/remove/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  '${securityUser.tokenType} ${securityUser.accessToken}',
            },
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return removeUserDetail(id);
    }
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? "Success: User"
        : "Error: User ${response.statusCode}";
  }
}
