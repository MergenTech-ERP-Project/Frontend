import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ActivityCardDeleteButton extends StatelessWidget {
  const ActivityCardDeleteButton({
    Key? key,
    required this.size,
    required this.activity,
  }) : super(key: key);
  final double size;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Icon(
          Icons.delete,
          color: Colors.redAccent,
          size: size,
        ),
      ),
      onTap: () {
        showDialogAreYouSureDelete(
          context,
          () async {
            showDialogWaitingMessage(context);
            await activityController.deleteActivity(activity.id);
            Navigator.of(context).pop(true);
            showDialogDoneMessage(context);
          },
        );
      },
    );
  }
}
