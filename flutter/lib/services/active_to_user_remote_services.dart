// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/active_to_user.dart';
import 'package:vtys_kalite/routing/routes.dart';

class ActiveToUserRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<ActiveToUser>?> fetchActiveToUsers() async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activetouser/activetousers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        //'Authorization': '<Your token>'
      },
    );
    print("fetchActiveToUsers response ${response.statusCode}");
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("JSON : $jsonString");
      return activeToUserFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchActiveToUser(int activityId, int userId) async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activetouser/activetousers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        //'Authorization': '<Your token>'
      },
    );
    int id = -1;
    print("fetchActiveToUser response ${response.statusCode}");
    if (response.statusCode == 200) {
      var jsonString = response.body;

      print("JSON : $jsonString");
    }
    return id;
  }

  static Future<String> postActiveToUser(String json) async {
    var response = await http
        .post(Uri.parse(serviceHttp + '/activetouser/post'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    print("postActiveToUser : JSON : $json");
    return response.statusCode == 200
        ? "Success: ActiveToUser"
        : "Error: ActiveToUser ${response.statusCode}";
  }

  static Future<String> deleteActiveToUser(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/activetouser/delete/$id'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode == 200
        ? "Success: ActiveToUser"
        : "Error: ActiveToUser ${response.statusCode}";
  }
}
