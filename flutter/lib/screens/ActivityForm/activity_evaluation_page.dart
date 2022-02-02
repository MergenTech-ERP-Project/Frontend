import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/main_form_page.dart';
import 'package:vtys_kalite/utilities/constants.dart';

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
    user = Statics.instance.getUser;

    DateTime date = dateTimeFormat.parse(activity.datetime);

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Date : ${date.year}.${date.month}.${date.day}",
                style: kLabelAppBarThinStyle,
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
                  buildReadOnlyCustomTextBox("Username",user.name,true),
                  buildReadOnlyCustomTextBox("Organizer",activity.organizator,true),
                  evaluationContainer(),
                  const SizedBox(height: 20),
                  saveCustomButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomButton saveCustomButton(BuildContext context) {
    return CustomButton(
                  title: "Save",
                  pressAction: () {
                    setState(() {
                      Statics.instance.activityEvaluationController
                          .postActivityEvaluation(
                          activity.id, user.id, widget._evaluationController.text);
                      Navigator.pushReplacementNamed(context, MainFormPage.routeName);
                    });
                  },
                );
  }
  CustomTextBox buildReadOnlyCustomTextBox
      (String? title, String? hint, bool? readOnly) {
    return CustomTextBox(
      title: title,
      hint: hint,
      readOnly: readOnly,
    );
  }
  Container evaluationContainer() {
    return Container(
      height: 200,
      child: TextFormField(
        controller: widget._evaluationController,
        textAlign: TextAlign.start,
        maxLines: null,
        minLines: null,
        expands: true,
        decoration: InputDecoration(
          hintText: "Please, write your thoughts about the event here...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
