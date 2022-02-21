import 'package:flutter/material.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card_small.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class EmployeeCard extends StatefulWidget {
  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
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
        return FutureBuilder(
          future: activityEvaluationController.fetchActivityEvaluation(
              activityController.activityList[index - 1].id, user.id),
          builder: (context, snap) {
            return snap.hasData
                ? ActivityCardSmall(
                    context: context,
                    height: 80,
                    activity: activityController.activityList[index - 1],
                    activityEvaluationId: snap.data as int,
                  )
                : const SizedBox();
          },
        );
      },
    );
  }
}
