import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/activity_evaluation.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class ActivityFormPage extends StatefulWidget {
  static String routeName = '/ActivityFormPage';

  ActivityFormPage({Key? key}) : super(key: key);

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  @override
  Widget build(BuildContext context) {
    Statics.instance.userController.fetchUsers();
    Statics.instance.activityController.fetchActivities();

    print(
        "activityList Size ${Statics.instance.activityController.activityList.length}");
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return (Statics.instance.activityController.isLoading.value
              ? const CircularProgressIndicator()
              : Text(Statics.instance.userController
                  .userList[Statics.instance.userId].name));
        }),
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondaryColor,
        centerTitle: true,
        leading: Container(
          child: const Icon(Icons.menu, color: kSecondaryColor),
          color: kPrimaryColor,
        ),
        //hamburger menu
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(child: Obx(() {
          return (Statics.instance.activityController.isLoading.value
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200),
                  child: ListView.builder(
                    itemCount:
                        Statics.instance.activityController.activityList.length,
                    itemBuilder: (context, index) {
                      return buildActivityCard(index,
                          Statics.instance.activityController.activityList[index]);
                    },
                  ),
                ));
        })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewActivityPage.routeName);
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, color: kSecondaryColor),
      ),
    );
  }

  Card buildActivityCard(int index, Activity activity) {
    for (ActivityEvaluation ae in Statics
        .instance.activityEvaluationController.activityEvaluationList) {
      if (ae.userId == Statics.instance.userController.userList[Statics.instance.userId].id &&
          ae.activityId == Statics.instance.activityController.activityList[index].id) {
        return Card(
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(activity.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.check, color: kColorGreen),
                    Text(" Answered", style: TextStyle(color: kColorGreen)),
                  ],
                ),
              ],
            ),
            subtitle: Text(activity.organizator),
          ),
        );
      }
    }
    return Card(
      child: ListTile(
        onTap: () {
          setState(() {
            Navigator.pushNamed(context, ActivityEvaluationPage.routeName,
                arguments: {'activityId': index});
          });
        },
        title: Text(activity.name),
        subtitle: Text(activity.organizator),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              Statics.instance.activityController
                  .deleteActivity(activity.name, activity.organizator);
            });
          },
          icon: const Icon(Icons.delete, color: kColorRed),
        ),
      ),
    );
  }
}
