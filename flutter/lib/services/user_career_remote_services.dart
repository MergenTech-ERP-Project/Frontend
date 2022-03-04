// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/routing/routes.dart';

class UserDetailCareerServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<UserDetailCareer?> fetchUserDetailCareerById(id) async {
    var response = await http.get(Uri.parse(serviceHttp + '/careers/list/$id'));
    UserDetailCareer? userDetailCareer;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      userDetailCareer = parseUserCareer(jsonString);
    }
    return userDetailCareer;
  }

  static Future<int> addNewUserDetailCareer(String json) async {
    print(json);
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/careers/post'),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode;
  }

  static Future<String> updateUserDetailCareer(int id, String json) async {
    var response = await http
        .put(Uri.parse(serviceHttp + '/careers/put/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? "Success: User Career"
        : "Error: User Career ${response.statusCode}";
  }

  static Future<String> deleteUserDetailCareers(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/careers/delete/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? "Success: User Career"
        : "Error: User Career${response.statusCode}";
  }
}
