import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/widgets/side_menu.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class MainFormBody extends StatefulWidget {
  @override
  State<MainFormBody> createState() => _MainFormBodyState();
}

class _MainFormBodyState extends State<MainFormBody> {
  @override
  void initState() {
    super.initState();
    userController.fetchUsers();
    activityController.fetchActivities();
    activityEvaluationController.fetchActivityEvaluations();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () {
          return (activityController.isLoading.value
              ? const CircularProgressIndicator()
              : buildActivityCardList());
        },
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
              activityController.activityList[index - 1].id, user.id),
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
          onPressed: () => Get.toNamed(newActivityPageRoute),
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
              const CustomText(
                text: "  Add New Activity",
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
            CustomText(text: activity.name),
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
                      CustomText(
                        text: " Answered",
                        color: Colors.green,
                      ),
                    ],
                  ),
          ],
        ),
        subtitle: CustomText(text: activity.organizator),
        onTap: () {
          setState(() {
            if (activityEvaluationId == -1) {
              activityEvaluationController.activityEvaluationId =
                  activityEvaluationId;
            }
          });
        },
      ),
    );
  }
}
