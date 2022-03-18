// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
import 'package:vtys_kalite/routing/routes.dart';

class UserDetailVacationServices {
  static Encoding? encoding = Encoding.getByName('utf-8');
  static Future<UserDetailVacation?> fetchUserDetailVacationByUserDetailId(
      userDetailId) async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/vacation/list/$userDetailId'));
    UserDetailVacation? userDetailVacation;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      userDetailVacation = parseUserDetailVacation(jsonString);
    }
    return userDetailVacation;
  }

  static Future<int> addNewUserDetailVacation(String json) async {
    print(json);
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/vacation/new'),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        )
        .onError((error, stackTrace) => throw error.toString());
    return response.statusCode;
  }

  static Future<int> updateUserDetailVacation(
      int id, String json) async {
    var response = await http
        .put(Uri.parse(serviceHttp + '/vacation/update/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        ).onError((error, stackTrace) => throw error.toString());
    return response.statusCode;
  }

  static Future<String> deleteUserDetailVacation(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/vacation/delete/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        ).onError((error, stackTrace) => throw error.toString());
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? "Success: User Vacation"
        : "Error: User Vacation${response.statusCode}";
  }
}
