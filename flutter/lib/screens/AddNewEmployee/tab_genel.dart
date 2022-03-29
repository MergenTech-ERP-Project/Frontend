// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee_helpers.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_small.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card_small.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabGenel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showInformationWhenOnClick();
    print("Tab Genel" + userHelper.userId.toString());
    return ResponsiveWidget(
      largeScreen: userHelper.userId > 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  TabGenelFirstCard(user: userHelper.user!),
                  TabGenelSecondCard(user: userHelper.user),
                ],
              ),
            )
          : TabGenelSecondCard(),
      smallScreen: userHelper.userId > 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  TabGenelFirstCardSmall(user: userHelper.user!),
                  TabGenelSecondCardSmall(user: userHelper.user),
                ],
              ),
            )
          : TabGenelSecondCardSmall(user: User()),
    );
  }
}
