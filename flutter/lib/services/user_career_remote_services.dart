// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserDetailCareerServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<UserDetailCareer?> fetchUserDetailCareerById(
      userDetailId) async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/career/list/$userDetailId'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      return parseUserCareer(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchUserDetailCareerById(userDetailId);
    } else {
      return null;
    }
  }

  static Future<int> addNewUserDetailCareer(String json) async {
    print(json);
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/career/new'),
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
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return addNewUserDetailCareer(json);
    }
    return response.statusCode;
  }

  static Future<int> updateUserDetailCareer(int id, String json) async {
    var response = await http
        .put(Uri.parse(serviceHttp + '/career/update/$id'),
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
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return updateUserDetailCareer(id, json);
    }
    return response.statusCode;
  }

  static Future<String> deleteUserDetailCareers(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/career/remove/$id'),
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
      return deleteUserDetailCareers(id);
    }
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? "Success: User Career"
        : "Error: User Career${response.statusCode}";
  }
}
