import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AdminPanel/admin_panel.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

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
    return SafeArea(
      child: Center(child: Obx(() {
        return (Statics.instance.activityController.isLoading.value
            ? const CircularProgressIndicator()
            : Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildActivityCardList(),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  )
                ],
              ));
      })),
    );
  }

  ListView buildActivityCardList() {
    return ListView.builder(
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
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pushReplacementNamed(
                  context, NewActivityPage.routeName);
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kSecondaryColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.grey.shade700,
                size: 22,
              ),
              Text(
                "  Add New Activity",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
              ),
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
              Navigator.pushReplacementNamed(
                  context, ActivityEvaluationPage.routeName,
                  arguments: {'activityId': index});
            }
          });
        },
      ),
    );
  }
}
