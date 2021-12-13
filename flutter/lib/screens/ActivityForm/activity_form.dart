import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/controller/activity_controller.dart';
import 'package:vtys_kalite/controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/activity_evaluation.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class ActivityFormPage extends StatefulWidget {
  static String routeName = '/ActivityFormPage';

  ActivityFormPage({Key? key}) : super(key: key);

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  static int universalUserId = 0;
  static int activityId = 0;

  //List<String> activityString = ["asd", "qwe", "tyu", "bnm"];

  late UserController userController;
  late ActivityController activityController;
  late ActivityEvaluationController activityEvaluationController;

  @override
  Widget build(BuildContext context) {
    userController = Get.put(UserController());
    activityController = Get.put(ActivityController());
    activityEvaluationController = Get.put(ActivityEvaluationController());
    universalUserId = ModalRoute.of(context)!.settings.arguments as int;
    print("activityList Size ${activityController.activityList.length}");
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(userController.userList[universalUserId].name)),
        centerTitle: true,
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
          return (activityController.isLoading.value
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200),
                  child: ListView.builder(
                    itemCount: activityController.activityList.length,
                    itemBuilder: (context, index) {
                      return buildActivityCard(
                          activityController.activityList[index], index);
                    },
                  ),
                ));
        })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewActivityPage.routeName,
              arguments: universalUserId);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Card buildActivityCard(Activity activity, int index) {
    activityId = index;
    for (ActivityEvaluation ae
        in activityEvaluationController.activityEvaluationList) {
      if (ae.userId == userController.userList[universalUserId].id &&
          ae.activityId == activityController.activityList[activityId].id) {
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
                arguments: {
                  'userId': universalUserId,
                  'activityId': index
                });
          });
        },
        title: Text(activity.name),
        subtitle: Text(activity.organizator),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              activityController.deleteActivity(
                  activity.name, activity.organizator);
            });
          },
          icon: const Icon(Icons.delete, color: kColorRed),
        ),
      ),
    );
  }
}
