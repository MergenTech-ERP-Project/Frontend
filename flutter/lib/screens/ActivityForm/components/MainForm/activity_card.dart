// ignore_for_file: avoid_print

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

class ActivityCard extends StatelessWidget {
  final Activity activity;
  var activityEvaluationId = -1;
  final isFetch = false.obs;

  ActivityCard({
    Key? key,
    required this.activity,
  }) : super(key: key) {
    checkAnswer();
  }

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
    return Obx(
      () => isFetch.value
          ? Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: CircularProgressIndicator()),
            )
          : InkWell(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 10,
                          width: 300,
                          decoration: BoxDecoration(
                            color: activityEvaluationId != -1
                                ? Colors.greenAccent
                                : Colors.redAccent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              const Expanded(flex: 1, child: Text("")),
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 12,
                              ),
                              CustomText(
                                text: "  " + activity.datetime!,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                        const Expanded(flex: 1, child: Text("")),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomText(
                            text: activity.name,
                            size: 24,
                            weight: FontWeight.w400,
                          ),
                        ),
                        const Expanded(flex: 1, child: Text("")),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomText(
                            text: activity.organizator,
                            size: 18,
                            weight: FontWeight.w400,
                          ),
                        ),
                        const Expanded(flex: 2, child: Text("")),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActivityCardEditButton(
                            size: 24,
                            activity: activity,
                            then: (value) => checkAnswer(),
                          ),
                          ListActivityEvaluationsButton(
                            size: 24,
                            activity: activity,
                            then: (value) {},
                          ),
                          ActivityCardDeleteButton(
                            size: 24,
                            activity: activity,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: activityEvaluationId == -1
                  ? () => showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: lightColor,
                          child: ActivityEvaluationPage(
                            activity: activity,
                          ),
                        ),
                      ).then((value) => checkAnswer())
                  : null),
    );
  }
}
