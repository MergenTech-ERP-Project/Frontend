// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluations/list_activity_evaluations_button.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/components/new_activity_delete_button.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/components/new_activity_edit_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityCardSmall extends StatelessWidget {
  final BuildContext context;
  final double? height;
  final Activity activity;
  int activityEvaluationId = -1;

  ///TODO: Add Dialog to delete button to proceed deleting the activity is ok?

  ActivityCardSmall({
    Key? key,
    required this.activity,
    required this.context,
    this.height,
  }) : super(key: key);

  final isFetch = false.obs;
  checkAnswer() async {
    isFetch(true);
    try {
      activityEvaluationId = await activityEvaluationController
          .fetchActivityEvaluation(activity.id, user.id);
      print("Activity Card : " +
          activity.id.toString() +
          ", " +
          activityEvaluationId.toString());
    } finally {
      isFetch(false);
    }
  }
  @override
  Widget build(BuildContext context) {
    if (activityEvaluationId == -1 &&
        isFetch.isFalse &&
        activityController.isLoading.isFalse) {
      checkAnswer();
    }
    return Obx(
      () => isFetch.value
          ? Container(
              height: height,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: CircularProgressIndicator()),
            )
          : InkWell(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: activityEvaluationId != -1
                                ? Colors.greenAccent
                                : Colors.redAccent,
                          ),
                          width: 8,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 130,
                        height: height,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: CustomText(
                                  text: activity.name,
                                  size: 24,
                                  weight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: activity.organizator,
                                    size: 12,
                                  ),
                                  const Expanded(child: SizedBox()),
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 16,
                                  ),
                                  CustomText(
                                    text: "  " + activity.datetime!,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 5,
                        width: 120,
                        height: height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ActivityCardEditButton(
                              size: 30,
                              activity: activity,
                              then: (value) => checkAnswer(),
                            ),
                            ListActivityEvaluationsButton(
                              size: 30,
                              activity: activity,
                              then: (value) {},
                            ),
                            ActivityCardDeleteButton(
                              size: 30,
                              activity: activity,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: activityEvaluationId == -1
                  ? () => showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: ActivityEvaluationPage(
                            activity: activity,
                          ),
                        ),
                      ).then((value) => checkAnswer())
                  : null,
            ),
    );
  }
}
