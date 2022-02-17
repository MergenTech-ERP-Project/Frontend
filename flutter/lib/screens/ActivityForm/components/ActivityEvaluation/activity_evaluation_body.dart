import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

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
    return Row(
      children: [
        const Expanded(child: CustomText(text: "")),
        Expanded(
          flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 2,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Activity:",
                    color: blackColor,
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                    text: widget.activity.name,
                    color: blackColor,
                    size: 18,
                    weight: FontWeight.w200,
                  ),
                  CustomText(
                    text: "Username:",
                    color: blackColor,
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                    text: widget.user.name,
                    color: blackColor,
                    size: 18,
                    weight: FontWeight.w200,
                  ),
                  CustomText(
                    text: "Organizer:",
                    color: blackColor,
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                    text: widget.activity.organizator,
                    color: blackColor,
                    size: 18,
                    weight: FontWeight.w200,
                  ),
                  evaluationContainer(),
                  const SizedBox(height: 20),
                  saveCustomButton(context),
                ],
              ),
            ),
          ),
        ),
        const Expanded(child: CustomText(text: "")),
      ],
    );
  }

  Widget saveCustomButton(BuildContext context) {
    return Center(
      child: CustomButton(
        width: double.infinity,
        height: 60,
        title: "Save",
        pressAction: () => setState(
          () {
            activityEvaluationController.postActivityEvaluation(
                widget.activity.id,
                widget.user.id,
                widget._evaluationController.text);
            Get.back();
          },
        ),
      ),
    );
  }

  Widget evaluationContainer() {
    return SizedBox(
      height: 150,
      child: TextFormField(
        controller: widget._evaluationController,
        textAlign: TextAlign.start,
        maxLines: null,
        minLines: null,
        expands: true,
        decoration: const InputDecoration(
          hintText: "Please, write your thoughts about the event here...",
        ),
      ),
    );
  }
}
