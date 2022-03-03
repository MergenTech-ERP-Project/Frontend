import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_small.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card_small.dart';

class TabGenel extends StatelessWidget {
  User? user;

  TabGenel({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: user != null
          ? Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TabGenelFirstCard(user: user!),
                ),
                Expanded(
                  flex: 4,
                  child: TabGenelSecondCard(user: user),
                ),
              ],
            )
          : TabGenelSecondCard(user: User()),
      smallScreen: user != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  TabGenelFirstCardSmall(user: user!),
                  TabGenelSecondCardSmall(user: user),
                ],
              ),
            )
          : TabGenelSecondCardSmall(user: User()),
    );
  }
}
