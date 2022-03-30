// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity_evaluation.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityEvaluationRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<ActivityEvaluation>?> fetchActivityEvaluations() async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/activityevaluation/list'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return activityEvaluationFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActivityEvaluations();
    } else {
      return null;
    }
  }

  static Future<int> fetchActivityEvaluation(int activityId, int userId) async {
    var response = await http.get(
        Uri.parse(serviceHttp + '/activityevaluation/list/$activityId/$userId'),
        headers: {
          'Authorization':
              '${securityUser.tokenType} ${securityUser.accessToken}',
        });
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
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActivityEvaluation(activityId, userId);
    } else {
      return activityEvaluationID;
    }
    return activityEvaluationID;
  }

  static Future<List<ActivityEvaluation>?> fetchActivityEvaluationsByActivityId(
      int activityId) async {
    var response = await http.get(
        Uri.parse(serviceHttp + '/activityevaluation/list/$activityId'),
        headers: {
          'Authorization':
              '${securityUser.tokenType} ${securityUser.accessToken}',
        });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<ActivityEvaluation> activityEvaluations =
          activityEvaluationFromJson(jsonString);
      return activityEvaluations
          .where((element) => element.activityId == activityId)
          .toList();
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchActivityEvaluationsByActivityId(activityId);
    } else {
      return null;
    }
  }

  static Future<String> addActivityEvaluation(String json) async {
    var response = await http
        .post(Uri.parse(serviceHttp + '/activityevaluation/new'),
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
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return addActivityEvaluation(json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Activity"
        : "Error: Activity ${response.statusCode}";
  }
}
