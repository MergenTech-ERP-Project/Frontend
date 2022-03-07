import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityListLarge extends StatelessWidget {
  final gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 250,
    childAspectRatio: 1.2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: gridDelegate,
      itemCount: activityController.activityList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const NewActivityButton();
        }
        return ActivityCard(
          activity: activityController.activityList[index - 1],
        );
      },
    );
  }
}
