import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card_small.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityListSmall extends StatelessWidget {
  const ActivityListSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        itemCount: activityController.activityList.length + 1,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const NewActivityButton(
              height: 80,
            );
          }
          return ActivityCardSmall(
            context: context,
            height: 80,
            activity: activityController.activityList[index - 1],
          );
        },
      ),
    );
  }

}
