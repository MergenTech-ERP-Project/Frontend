import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constants.dart';

import '../../activity_evaluation_page.dart';
import '../../new_activity_page.dart';

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
            : Flexible(
                child: buildActivityCardList(screenSize.width / 4),
              ));
      })),
    );
  }

  ListView buildActivityCardList(horizontalPadding) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      itemCount: Statics.instance.activityController.activityList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return buildNewActivityButton(context);
        }
        return FutureBuilder(
          future: Statics.instance.activityEvaluationController
              .fetchActivityEvaluation(
                  Statics
                      .instance.activityController.activityList[index - 1].id,
                  widget.user.id),
          builder: (context, snap) {
            Widget card = const SizedBox();
            if (snap.hasData) {
              card = buildActivityCard(
                  index - 1,
                  Statics.instance.activityController.activityList[index - 1],
                  snap.data as int);
            }
            return card;
          },
        );
      },
    );
  }

  Container buildNewActivityButton(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pushReplacementNamed(context, NewActivityPage.routeName);
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
          ),
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.grey.shade700),
              Text("  Add New Activity",
                  style: TextStyle(color: Colors.grey.shade700)),
            ],
          ),
        ),
      ),
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
              Navigator.pushReplacementNamed(context, ActivityEvaluationPage.routeName,
                  arguments: {'activityId': index});
            }
          });
        },
      ),
    );
  }
}
