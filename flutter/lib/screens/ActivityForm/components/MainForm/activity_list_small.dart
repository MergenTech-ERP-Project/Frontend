import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card_small.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityListSmall extends StatefulWidget {
  @override
  _ActivityListSmallState createState() => _ActivityListSmallState();
}

class _ActivityListSmallState extends State<ActivityListSmall> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activityController.activityList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return NewActivityButton(
            height: 80,
          );
        }
        return ActivityCardSmall(
          context: context,
          height: 80,
          activity: activityController.activityList[index - 1],
        );
      },
    );
  }
}
