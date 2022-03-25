// ignore_for_file: must_be_immutable

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
  TabGenel({
    Key? key,
  }) : super(key: key) {
    showInformationWhenOnClick();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: userHelper.user != null
          ? Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TabGenelFirstCard(
                    user: userHelper.user!,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: TabGenelSecondCard(user: userHelper.user),
                ),
              ],
            )
          : TabGenelSecondCard(),
      smallScreen: userHelper.user != null
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
