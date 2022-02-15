import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_card.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class MyActivities extends StatefulWidget {
  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  void initState() {
    activityController.fetchActivities();
    activityEvaluationController.fetchActivityEvaluations();
    super.initState();
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
            flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 8,
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

  GridView buildActivityCardList() {
    return GridView.builder(
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
                ? ActivityCard(
                    context: context,
                    activity: activityController.activityList[index - 1],
                    activityEvaluationId: snap.data as int,
                  )
                : const SizedBox();
          },
        );
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }

  Widget buildNewActivityButton(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: lightColor,
          child: NewActivityPage(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: activeDarkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 22,
            ),
            Flexible(
              child: CustomText(
                text: "  Add New Activity",
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
