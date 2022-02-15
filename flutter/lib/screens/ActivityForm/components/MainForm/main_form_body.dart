import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
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
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: CustomText(text: ""),
          ),
          Expanded(
            flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 6,
            child: Obx(
              () {
                return (activityController.isLoading.value
                    ? const Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : buildActivityCardList());
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: CustomText(text: ""),
          ),
        ],
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
            return snap.hasData
                ? buildActivityCard(
                    index - 1,
                    activityController.activityList[index - 1],
                    snap.data as int,
                  )
                : const SizedBox();
          },
        );
      },
    );
  }

  Widget buildNewActivityButton(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () => Get.toNamed(newActivityPageRoute),
            child: Container(
              decoration: BoxDecoration(
                color: activeDarkColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(5),
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 22,
                  ),
                  CustomText(
                    text: "  Add New Activity",
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildActivityCard(
      int index, Activity activity, int activityEvaluationId) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CustomText(text: activity.name),
                          CustomText(text: activity.organizator),
                        ],
                      ),
                      Expanded(child: Container()),
                      CustomText(text: activity.datetime),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      if (activityEvaluationId == -1) {
                        activityEvaluationController.setActivityId(activity.id);
                        printInfo(info: activity.id.toString());
                        Get.toNamed(activityEvaluationPageRoute);
                      }
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: activityEvaluationId == -1
                    ? InkWell(
                        child: const Icon(Icons.delete, color: Colors.red),
                        onTap: () {
                          setState(() {
                            activityController.deleteActivity(
                                activity.name, activity.organizator);
                          });
                        },
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
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
