// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Activity>?> fetchActivities() async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activity/list'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
       'Authorization':
            '${securityUser.tokenType} ${securityUser.accessToken}',
      },
    );
    print("fetchActivities response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      print("JSON : $jsonString");
      return activityFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActivities();
    } else {
      return null;
    }
  }

  static Future<List<Activity>?> fetchActivitiesByUser(int userId) async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activetouser/user/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
       'Authorization':
            '${securityUser.tokenType} ${securityUser.accessToken}',
      },
    );
    print(
        "fetchActivities by user $userId response ${response.statusCode}\n ${response.body}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      print("JSON : $jsonString");
      return activityFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActivitiesByUser(userId);
    } else {
      return null;
    }
  }

  static Future<Activity?> fetchActivitybyId(int id) async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activity/list/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization':
            '${securityUser.tokenType} ${securityUser.accessToken}',
      },
    );
    print("fetchActivity response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return activityFromJson(jsonString)[0];
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActivitybyId(id);
    } else {
      return null;
    }
  }

  static Future<String> addActivity(String json) async {
    print("Json: $json");
    var response = await http
        .post(Uri.parse(serviceHttp + '/activity/new'),
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
      return addActivity(json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }

  static Future<String> updateActivity(int id, String json) async {
    print("Put Activity $id Json: $json");
    var response = await http
        .put(Uri.parse(serviceHttp + '/activity/update/$id'),
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
      return updateActivity(id, json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }

  static Future<String> removeActivity(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/activity/remove/$id'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
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
      return removeActivity(id);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }
}
