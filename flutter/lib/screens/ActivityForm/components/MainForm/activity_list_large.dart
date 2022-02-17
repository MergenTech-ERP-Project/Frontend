import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityListLarge extends StatefulWidget {
  @override
  _ActivityListLargeState createState() => _ActivityListLargeState();
}

class _ActivityListLargeState extends State<ActivityListLarge> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: activityController.activityList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return NewActivityButton();
        }
        return FutureBuilder(
          future: activityEvaluationController.fetchActivityEvaluation(
              activityController.activityList[index - 1].id, user.id),
          builder: (context, snap) {
            return snap.hasData
                ? ActivityCard(
                    context: context,
                    activity: activityController.activityList[index - 1],
                    activityEvaluationId: snap.data as int,
                  )
                : const SizedBox();
          },
        );
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 1.2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }

}
