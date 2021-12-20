import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class ActivityEvaluationPage extends StatefulWidget {
  static String routeName = '/ActivityEvaluationPage';

  final TextEditingController _evaluationController = TextEditingController();

  ActivityEvaluationPage({Key? key}) : super(key: key);

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

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                width: 250,
                child: Text(
                  "Date : ${dateFormat.parse(activity.datetime).toString()}",
                  style: kTextThinStyle,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextBox(
                    readOnly: true,
                    title: "Username",
                    hint: user.name,
                  ),
                  CustomTextBox(
                    readOnly: true,
                    title: "Organizer",
                    hint: activity.organizator,
                  ),
                  Container(
                    height: 250,
                    child: TextFormField(
                      controller: widget._evaluationController,
                      textAlign: TextAlign.start,
                      maxLines: null,
                      minLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText:
                            "Please, write your thoughts about the event here...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: "Save",
                    pressAction: () {
                      setState(() {
                        Statics.instance.activityEvaluationController
                            .postActivityEvaluation(
                            activity.id, user.id, widget._evaluationController.text);
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
