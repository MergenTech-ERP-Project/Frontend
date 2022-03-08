import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluations/activity_evaluation_card.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ListActivityEvaluations extends StatelessWidget {
  final Activity activity;

  ListActivityEvaluations({
    Key? key,
    required this.activity,
  }) : super(key: key) {
    activityEvaluationController
        .fetchActivityEvaluationByActivityId(activity.id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => activityEvaluationController.isLoading.value
        ? const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width /
                (ResponsiveWidget.isLargeScreen(context) ? 2.5 : 1),
            height: activityEvaluationController.activityEvaluationList.length >
                    6
                ? activityEvaluationController.activityEvaluationList.length *
                    70
                : 6 * 80,
            child:
                activityEvaluationController.activityEvaluationList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(12),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: activityEvaluationController
                            .activityEvaluationList.length,
                        itemBuilder: (context, index) => ActivityEvaluationCard(
                          activityEvaluation: activityEvaluationController
                              .activityEvaluationList[index],
                        ),
                      )
                    : const Center(
                        child: CustomText(
                          text: "Bu Aktiviteye henüz cevap veren olmadı...",
                        ),
                      ),
          ));
  }
}
