// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/active_to_user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActiveToUserRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<ActiveToUser>?> fetchActiveToUsers() async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activetouser/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':
            '${securityUser.tokenType} ${securityUser.accessToken}',
      },
    );
    print("fetchActiveToUsers response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      print("JSON : $jsonString");
      return activeToUserFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActiveToUsers();
    } else {
      return null;
    }
  }

  static Future<int> fetchActiveToUser(int activityId, int userId) async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activetouser/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':
            '${securityUser.tokenType} ${securityUser.accessToken}',
      },
    );
    int id = -1;
    print("fetchActiveToUser response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      print("JSON : $jsonString");
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActiveToUser(activityId, userId);
    } else {
      return id;
    }
    return id;
  }

  static Future<String> addActiveToUser(String json) async {
    print("Post Active To User : $json");
    var response = await http
        .post(Uri.parse(serviceHttp + '/activetouser/new'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
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
      return addActiveToUser(json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: ActiveToUser"
        : "Error: ActiveToUser ${response.statusCode}";
  }

  static Future<String> removeActiveToUser(int id) async {
    var response = await http
        .delete(
          Uri.parse(serviceHttp + '/activetouser/remove/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization':
                '${securityUser.tokenType} ${securityUser.accessToken}',
          },
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return removeActiveToUser(id);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: ActiveToUser"
        : "Error: ActiveToUser ${response.statusCode}";
  }
}
