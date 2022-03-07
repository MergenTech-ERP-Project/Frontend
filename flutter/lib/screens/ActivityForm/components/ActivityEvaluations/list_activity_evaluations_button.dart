import 'package:flutter/material.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ActivityEvaluations/list_activity_evaluations.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ListActivityEvaluationsButton extends StatelessWidget {
  const ListActivityEvaluationsButton({
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
          Icons.library_books,
          color: greyColor,
          size: size,
        ),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: lightColor,
          child: ListActivityEvaluations(activity: activity),
        ),
      ).then(then),
    );
  }
}
