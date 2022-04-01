// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<User>?> fetchUsers() async {
    print("${securityUser.tokenType} ${securityUser.accessToken}");
    var response = await http.get(
      Uri.parse(serviceHttp + '/user_m/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':
            '${securityUser.tokenType} ${securityUser.accessToken}',
      },
    );
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return parseUsers(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchUsers();
    } else {
      return null;
    }
  }

  static Future<User?> fetchUserById(id) async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/user_m/list/$id'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      return parseUser(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchUserById(id);
    } else {
      return null;
    }
  }

  static Future<User?> fetchUserByName(name) async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/user_m/list/$name'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      return parseUser(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchUserById(name);
    } else {
      return null;
    }
  }

  static Future<int> addNewUser(String json) async {
    print(json);
    var response = await http
        .post(Uri.parse(serviceHttp + '/user_m/new'),
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
    print(response.statusCode);
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return addNewUser(json);
    }
    return response.statusCode;
  }

  static Future<int> updateUser(int id, String json) async {
    var response = await http
        .put(Uri.parse(serviceHttp + '/user_m/update/$id'),
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
    print(response.statusCode);
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return updateUser(id, json);
    }
    return response.statusCode;
  }

  static Future<int> removeUser(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/user_m/remove/$id'),
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
    print(response.statusCode);
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return removeUser(id);
    }
    return response.statusCode;
  }
}
