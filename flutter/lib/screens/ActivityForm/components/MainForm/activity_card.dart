// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation_page.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  var activityEvaluationId = -1;
  final isFetch = false.obs;

  ///TODO: Add Dialog to delete button to proceed deleting the activity is ok?

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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 5,
                          width: 300,
                          decoration: BoxDecoration(
                            color: activityEvaluationId != -1
                                ? Colors.greenAccent
                                : Colors.redAccent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              const Expanded(flex: 1, child: Text("")),
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 12,
                              ),
                              CustomText(
                                text: "  " + activity.datetime,
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
                        CustomText(
                          text: activity.organizator,
                        ),
                        const Expanded(flex: 1, child: Text("")),
                      ],
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      height: 24,
                      width: 24,
                      child: InkWell(
                        child: const Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                              backgroundColor: lightGreyColor,
                              titleWidget: Row(
                                children: [
                                  Icon(
                                    Icons.warning_rounded,
                                    size: 24,
                                    color: yellowColor,
                                  ),
                                  CustomText(
                                    text: "Dikkat",
                                    size: 24,
                                    color: yellowColor,
                                  ),
                                ],
                              ),
                              bodyWidget: Wrap(
                                children: const [
                                  Center(
                                    child: CustomText(
                                      text:
                                          "Silmek istediğinizden emin misiniz?",
                                      size: 18,
                                      weight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              bodyWidgetWidth: 350,
                              actions: [
                                Row(
                                  children: [
                                    InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.close,
                                              color: whiteColor,
                                            ),
                                            CustomText(
                                              text: "Hayır",
                                              color: whiteColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                    InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.done,
                                              color: yellowColor,
                                            ),
                                            CustomText(
                                              text: "Evet",
                                              color: yellowColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () async {
                                        showDialogWaitingMessage(context);
                                        await activityController
                                            .deleteActivity(activity.id);
                                        Navigator.of(context).pop(true);
                                        showDialogDoneMessage(context, true);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
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
