import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:vtys_kalite/controller/activity_controller.dart';
import 'package:vtys_kalite/controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class ActivityEvaluationPage extends StatefulWidget {
  static String routeName = '/ActivityEvaluationPage';

  ActivityEvaluationPage({Key? key}) : super(key: key);
  final TextEditingController _evaluationController = TextEditingController();

  @override
  _ActivityEvaluationPageState createState() => _ActivityEvaluationPageState();
}

class _ActivityEvaluationPageState extends State<ActivityEvaluationPage> {
  late int userId, activityId;
  final UserController userController = Get.put(UserController());
  final ActivityController activityController = Get.put(ActivityController());
  final ActivityEvaluationController activityEvaluationController = Get.put(ActivityEvaluationController());
  late Activity activity;
  late User user;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    userId = arguments['userId'];
    activityId = arguments['activityId'];
    print("Activity ID : $activityId");
    activity = activityController.activityList[activityId];
    user = userController.userList[userId];
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Text(activityController.isLoading.value
                ? "Activity's Name"
                : activity.name);
          }),
          centerTitle: true,
        ),
        body: Obx(() {
          return (activityController.isLoading.value
              ? const CircularProgressIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildNameOfOrganizator(),
                              buildDateOfActivity(),
                            ],
                          ),
                          const SizedBox(height: 50),
                          buildEvaluation(),
                          const SizedBox(height: 50),
                          Column(
                            children: [
                              buildUsername(),
                              buildButtonSave(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
        }));
  }

  Container buildButtonSave() {
    return Container(
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            activityEvaluationController.postActivityEvaluation(activity.id, user.id, widget._evaluationController.text);
            Navigator.pop(context);
          });
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Text("Save"),
      ),
    );
  }

  Container buildUsername() {
    return Container(
      width: 250,
      child: Text("Username : ${user.name}",
          style: kLabelStyle),
    );
  }

  TextFormField buildEvaluation() {
    return TextFormField(
      controller: widget._evaluationController,
      maxLines: 15,
      decoration: InputDecoration(
        hintText: "Please, write your thoughts about the event here...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Container buildDateOfActivity() {
    return Container(
      width: 250,
      child: Text("Date : ${dateFormat.parse(activity.datetime).toString()}",
          style: kLabelStyle),
    );
  }

  Container buildNameOfOrganizator() {
    return Container(
      width: 250,
      child: Column(
        children: [
          Text("Name : ${userController.userList[userId].name}",
              style: kLabelStyle),
        ],
      ),
    );
  }
}
