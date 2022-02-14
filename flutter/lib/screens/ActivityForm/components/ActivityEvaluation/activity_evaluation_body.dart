import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityEvaluationBody extends StatefulWidget {
  final User user;
  final Activity activity;

  ActivityEvaluationBody({
    Key? key,
    required this.user,
    required this.activity,
  }) : super(key: key);

  final TextEditingController _evaluationController = TextEditingController();
  @override
  State<ActivityEvaluationBody> createState() => _ActivityEvaluationBodyState();
}

class _ActivityEvaluationBodyState extends State<ActivityEvaluationBody> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildReadOnlyCustomTextBox("Username", widget.user.name, true),
                buildReadOnlyCustomTextBox(
                    "Organizer", widget.activity.organizator, true),
                evaluationContainer(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(flex: 2, child: cancelCustomButton(context)),
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(flex: 2, child: saveCustomButton(context)),
                  ],
                )
              ],
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
          activityEvaluationController.postActivityEvaluation(
              widget.activity.id,
              widget.user.id,
              widget._evaluationController.text);
          Get.offAllNamed(rootRoute);
        });
      },
    );
  }

  CustomButton cancelCustomButton(BuildContext context) {
    return CustomButton(
      title: "Cancel",
      pressAction: () => Get.offAllNamed(rootRoute),
    );
  }

  CustomTextBox buildReadOnlyCustomTextBox(
      String? title, String? hint, bool? readOnly) {
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
