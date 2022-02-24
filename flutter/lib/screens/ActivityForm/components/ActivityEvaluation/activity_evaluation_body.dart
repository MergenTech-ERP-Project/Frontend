import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityEvaluationBody extends StatefulWidget {
  final User user;
  final Activity activity;
  final DateTime date;

  ActivityEvaluationBody({
    Key? key,
    required this.user,
    required this.activity,
    required this.date,
  }) : super(key: key);

  final TextEditingController _evaluationController = TextEditingController();
  @override
  State<ActivityEvaluationBody> createState() => _ActivityEvaluationBodyState();
}

class _ActivityEvaluationBodyState extends State<ActivityEvaluationBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: blackColor,
              ),
              CustomText(
                text:
                    "Due To : ${widget.date.day}.${widget.date.month}.${widget.date.year}",
                color: blackColor,
                size: 18,
              ),
            ],
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Activity: ",
                        color: blackColor,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: widget.activity.name,
                        color: blackColor,
                        size: 18,
                        weight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Username: ",
                        color: blackColor,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: widget.user.name,
                        color: blackColor,
                        size: 18,
                        weight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Organizer: ",
                        color: blackColor,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: widget.activity.organizator,
                        color: blackColor,
                        size: 18,
                        weight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                evaluationContainer(),
                const SizedBox(height: 20),
                saveCustomButton(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget saveCustomButton(BuildContext context) {
    return Center(
      child: CustomButton(
        width: double.infinity,
        height: 40,
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
      height: 100,
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
