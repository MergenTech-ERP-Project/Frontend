import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/new_activity_initial_page.dart';
import 'package:vtys_kalite/utilities/style.dart';

class NewActivityPage extends StatefulWidget {
  List<User> selectedUsers = <User>[].obs;
  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}


class _NewActivityPageState extends State<NewActivityPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: lightColor,
      width: ResponsiveWidget.isSmallScreen(context) ? width : width / 1.6,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: NewActivityInitialPage(
              onNextButtonClick: () {},
            ),
          ),
        ],
      ),
    );
  }
}