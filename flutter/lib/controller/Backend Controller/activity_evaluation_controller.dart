// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/activity_evaluation.dart';
import 'package:vtys_kalite/services/activity_evaluation_remote_services.dart';

class ActivityEvaluationController extends GetxController {
  var isLoading = false.obs;
  List<ActivityEvaluation> activityEvaluationList =
      <ActivityEvaluation>[].obs; //List<Activity>

  @override
  void onInit() {
    fetchActivityEvaluations();
    super.onInit();
  }

  void fetchActivityEvaluations() async {
    try {
      isLoading(true);
      var activityEvaluations =
          await ActivityEvaluationRemoteServices.fetchActivityEvaluations();
      if (activityEvaluations != null) {
        activityEvaluationList.assignAll(activityEvaluations);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<int> fetchActivityEvaluation(int activityId, int userId) async {
    try {
      isLoading(true);
      var activityEvaluation =
          await ActivityEvaluationRemoteServices.fetchActivityEvaluation(
              activityId, userId);
      print("fetch Activity Evaluation: " + activityEvaluation.toString());
      return activityEvaluation;
    } finally {
      isLoading(false);
    }
  }

  void fetchActivityEvaluationByActivityId(int activityId) async {
    try {
      isLoading(true);
      var activityEvaluations = await ActivityEvaluationRemoteServices
          .fetchActivityEvaluationsByActivityId(activityId);
      if (activityEvaluations != null) {
        activityEvaluationList.assignAll(activityEvaluations);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String?> postActivityEvaluation(
      int activityId, int userId, String evaluation) async {
    try {
      isLoading(true);
      var response =
          await ActivityEvaluationRemoteServices.addActivityEvaluation(json
              .encode(ActivityEvaluation(
                id: 0,
                activityId: activityId,
                userId: userId,
                evaluation: evaluation,
              ).toJson())
              .toString());
      print("post Activity Evaluation: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
