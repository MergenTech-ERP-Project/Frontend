import 'package:flutter/material.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityCardEditButton extends StatelessWidget {
  const ActivityCardEditButton({
    Key? key,
    required this.size,
    required this.activity,
    required this.then,
  }) : super(key: key);
  final double size;
  final Activity activity;
  final Function(dynamic) then;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Icon(
          Icons.edit,
          color: blackColor,
          size: size,
        ),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: lightColor,
          child: NewActivityPage(
            activity: activity,
          ),
        ),
      ).then(then),
    );
  }
}
