import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/screens/ActivityForm/main_form_page.dart';
import 'package:vtys_kalite/utilities/constants.dart';
import '../../new_activity_page.dart';
import 'new_activity_select_users_page.dart';

class NewActivityCreateButton extends StatefulWidget {

  final NewActivitySelectUsersPage widget;
  const NewActivityCreateButton({
    Key? key,
    required this.widget,
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
          if(widget.widget.selectedUsers.isNotEmpty) {
            var response = Statics.instance.activityController.postActivity(
              NewActivityPage.nameController.text,
              NewActivityPage.placeController.text,
              dateTimeFormat.format(NewActivityPage.date).toString(),
              NewActivityPage.organizatorController.text,
              widget.widget.selectedUsers
            );
            print(response);
            Navigator.pushReplacementNamed(context, MainFormPage.routeName);
          }
        });
      },
    );
  }
}
