import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card_small.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/new_activity_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityListSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => activityController.isLoading.isFalse
          ? ListView.separated(
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
            )
          : Shimmer.fromColors(
              baseColor: lightGreyColor.withOpacity(.8),
              highlightColor: lightGreyColor.withOpacity(.8),
              child: ListView.separated(
                itemCount: 8,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) => Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
    );
  }

}
