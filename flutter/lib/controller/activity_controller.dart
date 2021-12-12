import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/services/activity_remote_services.dart';

class ActivityController extends GetxController {
  var isLoading = true.obs;
  List<Activity> activityList = <Activity>[].obs; //List<Activity>

  @override
  void onInit() {
    fetchActivities();
    super.onInit();
  }

  void fetchActivities() async {
    try {
      isLoading(true);
      var activities = await ActivityRemoteServices.fetchActivities();
      if (activities != null) {
        activityList.assignAll(activities);
        print("Fetch Activities was success!!!!!!!!!!!!!!!");
      }
    } finally {
      isLoading(false);
    }
  }

  Future<int> fetchActivity(String name, String organizator) async {
    try {
      var activity = await ActivityRemoteServices.fetchActivity(name, organizator);
      print("fetch Activity: " + activity.toString());
      return activity;
    } finally {
    }
  }

  Future<String?> postActivity(String name, String place, String datetime, String organizator) async {
    try {
      var response = await ActivityRemoteServices.postActivity(json.encode(Activity(
          id: 0,
          name: name,
          datetime: datetime,
          place: place,
          organizator: organizator,
      ).toJson()).toString());
      print("post Activity: " + response);
      return response;
    } finally {
    }
  }
}
