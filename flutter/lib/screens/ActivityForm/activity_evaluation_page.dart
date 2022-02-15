import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluation/activity_evaluation_app_bar.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluation/activity_evaluation_body.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityEvaluationPage extends StatefulWidget {
  late Activity activity;
  @override
  _ActivityEvaluationPageState createState() => _ActivityEvaluationPageState();
}

class _ActivityEvaluationPageState extends State<ActivityEvaluationPage> {
  var activityId = 0;

  @override
  void initState() {
    activityId = activityEvaluationController.activityId.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Activity Evaluation Activity ID : $activityId");
    
    activityController.activityList.forEach((e) {
      if (e.id == activityId) widget.activity = e;
    });
    DateTime date = dateTimeFormat.parse(widget.activity.datetime);
    return Scaffold(
      appBar: ActivityEvaluationAppBar(
        activity: widget.activity,
        date: date,
      ),
      body: ActivityEvaluationBody(
        user: user,
        activity: widget.activity,
      ),
    );
  }
}

/**FutureBuilder(
        future: activityController.fetchActivitybyId(activityId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            Activity? activity = snapshot.data as Activity?;
            DateTime date = dateTimeFormat.parse(activity!.datetime);
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
          return const Center(child: CustomText(text: "Waiting..."));
        }); */