import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityListLarge extends StatefulWidget {
  @override
  State<ActivityListLarge> createState() => _ActivityListLargeState();
}

class _ActivityListLargeState extends State<ActivityListLarge> {
  final gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 250,
    childAspectRatio: 1.2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  );

  @override
  void initState() {
    activityController.fetchActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => activityController.isLoading.value == false
          ? GridView.builder(
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
            )
          : Shimmer.fromColors(
              baseColor: lightGreyColor.withOpacity(.8),
              highlightColor: lightGreyColor.withOpacity(.8),
              child: GridView.builder(
                gridDelegate: gridDelegate,
                itemCount: 8,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
    );
  }
}
