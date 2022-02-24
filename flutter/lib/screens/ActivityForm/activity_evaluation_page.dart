import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluation/activity_evaluation_body.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityEvaluationPage extends StatefulWidget {
  final Activity activity;

  const ActivityEvaluationPage({
    Key? key,
    required this.activity,
  }) : super(key: key);
  @override
  _ActivityEvaluationPageState createState() => _ActivityEvaluationPageState();
}

class _ActivityEvaluationPageState extends State<ActivityEvaluationPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DateTime date = dateTimeFormat.parse(widget.activity.datetime);
    return SizedBox(
      width: ResponsiveWidget.isSmallScreen(context) ? width : width / 1.6,
      child: ActivityEvaluationBody(
        user: user,
        activity: widget.activity,
        date: date,
      ),
    );
  }
}
