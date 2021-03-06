// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/active_to_user.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/services/active_to_user_remote_services.dart';
import 'package:vtys_kalite/services/activity_remote_services.dart';

class ActivityController extends GetxController {
  RxBool isLoading = false.obs;
  List<Activity> activityList = <Activity>[].obs; //List<Activity>

  @override
  void onInit() {
    fetchActivities();
    super.onInit();
  }

  Future<void> fetchActivities() async {
    try {
      isLoading(true);
      var activities = await ActivityRemoteServices.fetchActivities();
      if (activities != null) {
        activityList.assignAll(activities);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchActivityByUserId(int userId) async {
    try {
      isLoading(true);
      var activities =
          await ActivityRemoteServices.fetchActivitiesByUser(userId);
      if (activities != null) {
        activityList.assignAll(activities);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Activity?> fetchActivitybyId(int id) async {
    try {
      isLoading(true);
      var activity = await ActivityRemoteServices.fetchActivitybyId(id);
      return activity;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> postActivity(Activity activity) async {
    try {
      isLoading(true);
      var response = await ActivityRemoteServices.addActivity(
          json.encode(activity.toJson()).toString());
      fetchActivities();
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> putActivity(Activity activity) async {
    try {
      isLoading(true);
      var response = await ActivityRemoteServices.updateActivity(
        activity.id,
        json.encode(activity.toJson()).toString(),
      );
      fetchActivities();
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> postActiveToUser(ActiveToUser activeToUser) async {
    try {
      var response = await ActiveToUserRemoteServices.addActiveToUser(
          json.encode(activeToUser.toJson()).toString());
      fetchActivities();
      return response;
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<String?> deleteActivity(id) async {
    try {
      isLoading(true);
      var response = await ActivityRemoteServices.removeActivity(id);
      fetchActivities();
      return response;
    } finally {
      isLoading(false);
    }
  }
}
