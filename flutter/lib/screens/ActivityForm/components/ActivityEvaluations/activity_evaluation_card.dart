// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/activity_evaluation.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityEvaluationCard extends StatelessWidget {
  final ActivityEvaluation activityEvaluation;
  const ActivityEvaluationCard({
    Key? key,
    required this.activityEvaluation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: CustomText(text: activityEvaluation.evaluation)),
    );
  }
}
