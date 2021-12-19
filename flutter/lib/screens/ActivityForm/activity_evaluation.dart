import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/core/statics.dart';
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
  late int activityId;
  late Activity activity;
  late User user;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    activityId = arguments['activityId'];
    print("Activity ID : $activityId");
    activity = Statics.instance.activityController.activityList[activityId];
    user = Statics.instance.userController.userList[Statics.instance.userId];
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Text(Statics.instance.activityController.isLoading.value
                ? "Activity's Name"
                : activity.name);
          }),
          centerTitle: true,
        ),
        body: Obx(() {
          return (Statics.instance.activityController.isLoading.value
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
            Statics.instance.activityEvaluationController.postActivityEvaluation(activity.id, user.id, widget._evaluationController.text);
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
          Text("Name : ${Statics.instance.userController.userList[Statics.instance.userId].name}",
              style: kLabelStyle),
        ],
      ),
    );
  }
}
