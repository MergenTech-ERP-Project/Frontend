import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/ListUsers/list_users.dart';

class NewActivitySelectUsersPage extends StatefulWidget {
  final Function() onPreviousButtonClick;

  NewActivitySelectUsersPage({
    Key? key,
    required this.onPreviousButtonClick,
  }) : super(key: key);

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
            child: ListUsers()),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                child: CustomButton(
                  title: 'Previous',
                  pressAction: widget.onPreviousButtonClick,
                ),
              ),
              const Expanded(flex: 1, child: Text("")),
              Expanded(
                flex: 2,
                child: CustomButton(
                  title: "Create",
                  pressAction: () {
                    ///active to user add selected user list
                    Get.offAllNamed(rootRoute);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
