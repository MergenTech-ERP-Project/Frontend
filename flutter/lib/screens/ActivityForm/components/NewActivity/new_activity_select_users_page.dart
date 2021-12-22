import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ListUsers/list_users.dart';
import '../../new_activity_page.dart';
import 'new_activity_create_button.dart';
import 'new_activity_previous_button.dart';

class NewActivitySelectUsersPage extends StatefulWidget {
  const NewActivitySelectUsersPage({
    Key? key,
    required this.selectedUsersisEmpty,
    required this.widget,
    required this.controller,
  }) : super(key: key);

  final bool selectedUsersisEmpty;
  final NewActivityPage widget;
  final PageController controller;

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
                  flex: 1,
                  child: NewActivityPreviousButton(
                      controller: widget.controller)),
              const Expanded(flex: 1, child: Text("")),
              Expanded(
                flex: 1,
                child: NewActivityCreateButton(
                  selectedUsersIsEmpty: widget.selectedUsersisEmpty,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
