import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/utilities/constans.dart';
import '../../new_activity_page.dart';

class NewActivityCreateButton extends StatefulWidget {
  final bool selectedUsersIsEmpty;

  const NewActivityCreateButton({
    Key? key,
    required this.selectedUsersIsEmpty,
  }) : super(key: key);

  @override
  State<NewActivityCreateButton> createState() => _NewActivityCreateButtonState();
}

class _NewActivityCreateButtonState extends State<NewActivityCreateButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Create",
      pressAction: () {
        setState(() {
          if(widget.selectedUsersIsEmpty) {
            var response = Statics.instance.activityController.postActivity(
                NewActivityPage.nameController.text,
                NewActivityPage.placeController.text,
                dateTimeFormat.format(NewActivityPage.date).toString(),
                NewActivityPage.organizatorController.text);
            print(response);
            Navigator.pop(context);
          }
        });
      },
    );
  }
}
