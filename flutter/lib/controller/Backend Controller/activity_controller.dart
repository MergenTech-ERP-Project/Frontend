import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/services/activity_remote_services.dart';

class ActivityController extends GetxController {
  RxBool isLoading = false.obs;
  List<Activity> activityList = <Activity>[].obs; //List<Activity>

  @override
  void onInit() {
    fetchActivities();
    super.onInit();
  }

  void fetchActivities() async {
     ///TODO: (inşallah) int userId fetchActivitiesByUser
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

  Future<int> fetchActivityByNameAndOrganizator(String name, String organizator) async {
    try {
      isLoading(true);
      var activity =
          await ActivityRemoteServices.fetchActivity(name, organizator);
      return activity;
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

  Future<String?> postActivity(String name, String place, String datetime,
      String organizator, List<User> selectedUsers) async {
    try {
      isLoading(true);
      var response = await ActivityRemoteServices.postActivity(json
          .encode(Activity(
            id: 0,
            name: name,
            datetime: datetime,
            place: place,
            organizator: organizator,
          ).toJson())
          .toString());
      fetchActivities();
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteActivity(String name, String organizator) async {
    try {
      isLoading(true);
      var response = "Failed!";

      for (Activity activity in activityList) {
        if (activity.name == name && activity.organizator == organizator) {
          response = await ActivityRemoteServices.deleteActivity(activity.id);
          break;
        }
      }
      fetchActivities();
      return response;
    } finally {
      isLoading(false);
    }
  }
}