import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation_page.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityCardSmall extends StatefulWidget {
  final BuildContext context;
  final double? height;
  final Activity activity;
  int activityEvaluationId = -1;

  ActivityCardSmall({
    Key? key,
    required this.activity,
    required this.context,
    this.height,
  }) : super(key: key);

  @override
  State<ActivityCardSmall> createState() => _ActivityCardSmallState();
}

class _ActivityCardSmallState extends State<ActivityCardSmall> {
  void func() async {
    widget.activityEvaluationId = await activityEvaluationController
        .fetchActivityEvaluation(widget.activity.id, user.id);
  }

  @override
  void initState() {
    func();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: activityEvaluationController.fetchActivityEvaluation(
          widget.activity.id, user.id),
      builder: (context, snap) {
        if (snap.hasData) {
          widget.activityEvaluationId = snap.data as int;
        }
        return Column(
          children: [
            const SizedBox(height: 10),
            InkWell(
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: widget.activityEvaluationId != -1
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                        width: 8,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 50,
                      height: widget.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: CustomText(
                                text: widget.activity.name,
                                size: 24,
                                weight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              children: [
                                CustomText(
                                  text: widget.activity.organizator,
                                  size: 16,
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 12,
                                ),
                                CustomText(
                                  text: "  " + widget.activity.datetime,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 5,
                      width: 40,
                      height: widget.height,
                      child: InkWell(
                        child: const Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 30,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            activityController.deleteActivity(
                                widget.activity.name,
                                widget.activity.organizator);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              onTap: widget.activityEvaluationId == -1
                  ? () async {
                      await showDialog(
                        context: widget.context,
                        builder: (_) => Dialog(
                        backgroundColor: whiteColor,
                          child:
                              ActivityEvaluationPage(activity: widget.activity),
                        ),
                      );
                    }
                  : null,
            ),
          ],
        );
      },
    );
  }
}
