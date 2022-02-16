import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_small.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card_small.dart';

class TabGenel extends StatefulWidget {
  const TabGenel({Key? key}) : super(key: key);

  @override
  _TabGenelState createState() => _TabGenelState();
}

class _TabGenelState extends State<TabGenel> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        children: [
          Expanded(
            flex: 3,
            child: TabGenelFirstCard(),
          ),
          Expanded(
            flex: 4,
            child: TabGenelSecondCard(),
          ),
        ],
      ),
      smallScreen: SingleChildScrollView(
        child: Column(
          children: [
            TabGenelFirstCardSmall(),
            TabGenelSecondCardSmall(),
          ],
        ),
      ),
    );
  }
}
