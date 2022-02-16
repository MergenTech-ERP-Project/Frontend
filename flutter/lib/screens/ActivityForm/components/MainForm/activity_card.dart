import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation_page.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityCard extends StatefulWidget {
  final BuildContext context;
  final Activity activity;
  final int activityEvaluationId;

  const ActivityCard({
    Key? key,
    required this.activity,
    required this.activityEvaluationId,
    required this.context,
  }) : super(key: key);

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 5,
                  width: 300,
                  color: widget.activityEvaluationId != -1
                      ? Colors.greenAccent
                      : Colors.redAccent,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Expanded(flex: 1, child: Text("")),
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
                const Expanded(flex: 1, child: Text("")),
                Flexible(
                  child: CustomText(
                    text: widget.activity.name,
                    size: 24,
                    weight: FontWeight.w400,
                  ),
                ),
                const Expanded(flex: 1, child: Text("")),
                CustomText(
                  text: widget.activity.organizator,
                ),
                const Expanded(flex: 1, child: Text("")),
              ],
            ),
            Positioned(
              right: 5,
              bottom: 5,
              height: 24,
              width: 24,
              child: InkWell(
                child: const Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    size: 22,
                  ),
                ),
                onTap: () {
                  setState(() {
                    activityController.deleteActivity(
                        widget.activity.name, widget.activity.organizator);
                  });
                },
              ),
            ),
          ],
        ),
      ),
      onTap: widget.activityEvaluationId == -1
          ? () => setState(() => showDialog(
              context: widget.context,
              builder: (_) => Dialog(
                    backgroundColor: whiteColor,
                    child: ActivityEvaluationPage(activity: widget.activity),
                  )))
          : null,
    );
  }
}
