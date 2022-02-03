import 'package:flutter/material.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ListUsers/list_users.dart';
import '../../new_activity_page.dart';
import 'new_activity_create_button.dart';
import 'new_activity_previous_button.dart';

class NewActivitySelectUsersPage extends StatefulWidget {
  const NewActivitySelectUsersPage({
    Key? key,
    required this.widget,
    required this.controller,
  }) : super(key: key);

  final NewActivityPage widget;
  final PageController controller;

  List<User> get selectedUsers => widget.selectedUsers;

  @override
  State<NewActivitySelectUsersPage> createState() =>
      _NewActivitySelectUsersPageState();
}

class _NewActivitySelectUsersPageState
    extends State<NewActivitySelectUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            flex: 8,
            child: ListUsers(selectedUsers: widget.widget.selectedUsers)),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: NewActivityPreviousButton(
                      controller: widget.controller)),
              const Expanded(flex: 1, child: Text("")),
              Expanded(
                flex: 2,
                child: NewActivityCreateButton(
                  widget: widget,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
