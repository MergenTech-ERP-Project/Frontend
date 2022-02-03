import 'package:flutter/material.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluation/activity_evaluation_app_bar.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluation/activity_evaluation_body.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class ActivityEvaluationPage extends StatefulWidget {
  static String routeName = '/ActivityEvaluationPage';

  const ActivityEvaluationPage({Key? key}) : super(key: key);

  @override
  _ActivityEvaluationPageState createState() => _ActivityEvaluationPageState();
}

class _ActivityEvaluationPageState extends State<ActivityEvaluationPage> {
  late int activityId;
  late Activity activity;
  late User user;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    activityId = arguments['activityId'];

    print("Activity ID : $activityId");
    activity = Statics.instance.activityController.activityList[activityId];
    user = Statics.instance.getUser;

    DateTime date = dateTimeFormat.parse(activity.datetime);

    return Scaffold(
      appBar: ActivityEvaluationAppBar(
        activity: activity,
        date: date,
      ),
      body: ActivityEvaluationBody(
        user: user,
        activity: activity,
      ),
    );
  }
}
