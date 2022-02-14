import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

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
      child: Center(
        child: Obx(
          () {
            return (activityController.isLoading.value
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
          },
        ),
      ),
    );
  }

  ListView buildActivityCardList() {
    return ListView.builder(
      itemCount: activityController.activityList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return buildNewActivityButton(context);
        }
        return FutureBuilder(
          future: activityEvaluationController.fetchActivityEvaluation(
              activityController.activityList[index - 1].id, widget.user.id),
          builder: (context, snap) {
            Widget card = const SizedBox();
            if (snap.hasData) {
              card = buildActivityCard(
                index - 1,
                activityController.activityList[index - 1],
                snap.data as int,
              );
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
              Navigator.pushReplacementNamed(context, newActivityPageRoute);
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(activeDarkColor),
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
                        activityController.deleteActivity(
                            activity.name, activity.organizator);
                      });
                    },
                    child: const Icon(Icons.delete, color: Colors.red),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.check, color: Colors.green),
                      Text(" Answered", style: TextStyle(color: Colors.green))
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
                  context, activityEvaluationPageRoute,
                  arguments: {'activityId': index});
            }
          });
        },
      ),
    );
  }
}
