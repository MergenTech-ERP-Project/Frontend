import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_second_card.dart';

class TabGenel extends StatefulWidget {
  const TabGenel({Key? key}) : super(key: key);

  @override
  _TabGenelState createState() => _TabGenelState();
}

class _TabGenelState extends State<TabGenel> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? Row(
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
          )
        : Container(
            constraints: BoxConstraints(maxHeight: 500, minHeight: 100),
            child: ListView(
              children: [
                Expanded(child: TabGenelFirstCard()),
                Expanded(child: TabGenelSecondCard()),
              ],
            ),
          );
  }
}
