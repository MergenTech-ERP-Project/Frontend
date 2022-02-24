import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_list_large.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_list_small.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class MyActivities extends StatefulWidget {
  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  void initState() {
    activityController.fetchActivities();
    activityEvaluationController.fetchActivityEvaluations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: CustomText(text: ""),
          ),
          Expanded(
            flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 8,
            child: Obx(
              () => activityController.isLoading.value
                  ? const Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : ResponsiveWidget(
                      largeScreen: ActivityListLarge(),
                      smallScreen: ActivityListSmall(),
                    ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: CustomText(
              text: "",
            ),
          ),
        ],
      ),
    );
  }
}
