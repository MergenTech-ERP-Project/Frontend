import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/activity_evaluation.dart';

class ActivityEvaluationRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<ActivityEvaluation>?> fetchActivityEvaluations() async {
    var response =
    await http.get(Uri.parse('https://kalite-takip-yonetim-sistemi.herokuapp.com/activityevaluation/evaluations'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return activityEvaluationFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchActivityEvaluation(int activityId, int userId) async {
    var response =
    await http.get(Uri.parse('https://kalite-takip-yonetim-sistemi.herokuapp.com/activityevaluation/evaluations'));
    int activityEvaluationID = -1;
    if (response.statusCode == 200) {
      var jsonString = response.body;
      List<ActivityEvaluation> activityEvaluations = activityEvaluationFromJson(jsonString);
      for(ActivityEvaluation evaluation in activityEvaluations) {
        if (evaluation.activityId == activityId && evaluation.userId == userId) {
          activityEvaluationID = activityEvaluations.indexOf(evaluation);
          break;
        }
      }
    }
    return activityEvaluationID;
  }

  static Future<String> postActivityEvaluation(String json) async {
    print("Json: $json");
    var response = await http
        .post(Uri.parse('https://kalite-takip-yonetim-sistemi.herokuapp.com/activityevaluation/post'),
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
