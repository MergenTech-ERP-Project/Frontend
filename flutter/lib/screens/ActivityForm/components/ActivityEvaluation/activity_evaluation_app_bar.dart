import 'package:flutter/material.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

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
        child: Text(
          activity.name,
          style: kLabelAppBarStyle,
        ),
      ),
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "Due To : ${date.day}.${date.month}.${date.year}",
              style: kLabelAppBarStyle,
            ),
          ),
        )
      ],
    );
  }
}
