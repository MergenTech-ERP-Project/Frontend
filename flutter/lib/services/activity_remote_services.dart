import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/activity.dart';

class ActivityRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Activity>?> fetchActivities() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8080/activity/activities'));
    print("fetchActivities response ${response.statusCode}");
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("JSON : $jsonString");
      return activityFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchActivity(String name, String organizator) async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8080/activity/activities'));
    print("fetchActivity response ${response.statusCode}");
    int activityID = -1;
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("JSON : $jsonString");
      List<Activity> activities = activityFromJson(jsonString);
      for(Activity activity in activities) {
        if (activity.name == name && activity.organizator == organizator) {
          activityID = activities.indexOf(activity);
          print(activityID);
          break;
        }
      }
    }
    return activityID;
  }

  static Future<String> postActivity(String json) async {
    print("Json: $json");
    var response = await http
        .post(Uri.parse('http://127.0.0.1:8080/activity/post'),
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
    return response.statusCode == 200
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }
}
