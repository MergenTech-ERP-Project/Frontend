import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

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
