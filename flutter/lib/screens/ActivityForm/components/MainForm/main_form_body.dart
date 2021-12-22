import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/activity_evaluation.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constans.dart';

import '../../activity_evaluation_page.dart';

class MainFormBody extends StatefulWidget {
  User user;

  MainFormBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<MainFormBody> createState() => _MainFormBodyState();
}

class _MainFormBodyState extends State<MainFormBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(child: Obx(() {
        return (Statics.instance.activityController.isLoading.value
            ? const CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
                child: ListView.builder(
                  itemCount:
                      Statics.instance.activityController.activityList.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                      future: Statics.instance.activityEvaluationController
                          .fetchActivityEvaluation(
                              Statics.instance.activityController
                                  .activityList[index].id,
                              widget.user.id),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          return buildActivityCard(
                              index,
                              Statics.instance.activityController
                                  .activityList[index],
                              snap.data as int);
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  },
                ),
              ));
      })),
    );
  }

  Card buildActivityCard(
      int index, Activity activity, int activityEvaluationId) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(activity.name),
            activityEvaluationId == -1
                ? InkWell(
                    onTap: () {
                      setState(() {
                        Statics.instance.activityController.deleteActivity(
                            activity.name, activity.organizator);
                      });
                    },
                    child: const Icon(Icons.delete, color: kColorRed),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.check, color: kColorGreen),
                      Text(" Answered", style: TextStyle(color: kColorGreen))
                    ],
                  ),
          ],
        ),
        subtitle: Text(activity.organizator),
        onTap: () {
          setState(() {
            print("Main Form activityEvaluationId:$activityEvaluationId");
            if (activityEvaluationId == -1) {
              Navigator.pushNamed(context, ActivityEvaluationPage.routeName,
                  arguments: {'activityId': index});
            }
          });
        },
      ),
    );
  }
}
