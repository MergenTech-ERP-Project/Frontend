import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity_evaluation.dart';
import 'package:vtys_kalite/routing/routes.dart';

class ActivityEvaluationRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<ActivityEvaluation>?> fetchActivityEvaluations() async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/activityevaluation/list'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return activityEvaluationFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchActivityEvaluation(int activityId, int userId) async {
    var response = await http
        .get(Uri.parse(
        serviceHttp + '/activityevaluation/list/$activityId/$userId'));
    int activityEvaluationID = -1;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<ActivityEvaluation> activityEvaluations =
          activityEvaluationFromJson(jsonString);
      for (ActivityEvaluation evaluation in activityEvaluations) {
        if (evaluation.activityId == activityId &&
            evaluation.userId == userId) {
          activityEvaluationID = activityEvaluations.indexOf(evaluation);
          break;
        }
      }
    }
    return activityEvaluationID;
  }

  static Future<List<ActivityEvaluation>?> fetchActivityEvaluationsByActivityId(
      int activityId) async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/activityevaluation/list/$activityId'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<ActivityEvaluation> activityEvaluations =
          activityEvaluationFromJson(jsonString);
      return activityEvaluations
          .where((element) => element.activityId == activityId)
          .toList();
    }
  }

  static Future<String> postActivityEvaluation(String json) async {
    var response = await http
        .post(Uri.parse(serviceHttp + '/activityevaluation/new'),
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
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }
}
