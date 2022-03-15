// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee_helpers.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_small.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card_small.dart';

class TabGenel extends StatelessWidget {
  User? user;
  UserHelperController userHelper;

  TabGenel({
    Key? key,
    this.user,
    required this.userHelper,
  }) : super(key: key) {
    showInformationWhenOnClick(user, userHelper);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: user != null
          ? Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TabGenelFirstCard(
                    user: user!,
                    userHelper: userHelper,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TabGenelSecondCard(user: user, userHelper: userHelper),
                ),
              ],
            )
          : TabGenelSecondCard(
              userHelper: userHelper,
            ),
      smallScreen: user != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  TabGenelFirstCardSmall(user: user!, userHelper: userHelper),
                  TabGenelSecondCardSmall(user: user, userHelper: userHelper),
                ],
              ),
            )
          : TabGenelSecondCardSmall(user: User(), userHelper: userHelper),
    );
  }
}
