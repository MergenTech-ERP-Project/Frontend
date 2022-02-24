import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

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
        return ActivityCard(
          index: index - 1,
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
