// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/routing/routes.dart';

class ActivityRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Activity>?> fetchActivities() async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activity/activities'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        //'Authorization': '<Your token>'
      },
    );
    print("fetchActivities response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = response.body;
      print("JSON : $jsonString");
      return activityFromJson(jsonString);
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
        //'Authorization': '<Your token>'
      },
    );
    print("fetchActivities response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = response.body;
      print("JSON : $jsonString");
      return activityFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Activity?> fetchActivitybyId(int id) async {
    var response = await http.get(
      Uri.parse(serviceHttp + '/activity/activities/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        //'Authorization': '<Your token>'
      },
    );
    print("fetchActivity response ${response.statusCode}");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = response.body;
      return activityFromJson(jsonString)[0];
    }
    return null;
  }

  static Future<String> postActivity(String json) async {
    print("Json: $json");
    var response = await http
        .post(Uri.parse(serviceHttp + '/activity/post'),
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
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }

  static Future<String> putActivity(int id, String json) async {
    print("Json: $json");
    var response = await http
        .post(Uri.parse(serviceHttp + '/activity/put/$id'),
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
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }

  static Future<String> deleteActivity(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/activity/delete/$id'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }
}
