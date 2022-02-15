import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityEvaluationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Activity activity;
  final DateTime date;

  const ActivityEvaluationAppBar({
    Key? key,
    required this.activity,
    required this.date,
  })  : preferredSize = const Size.fromHeight(60),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CustomText(
          text: activity.name,
          color: whiteColor,
          size: 20,
        ),
      ),
      backgroundColor: activeColor,
      foregroundColor: whiteColor,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CustomText(
              text: "Due To : ${date.day}.${date.month}.${date.year}",
              color: whiteColor,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}
