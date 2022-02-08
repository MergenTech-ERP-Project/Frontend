import 'package:flutter/material.dart';
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
    return Row(
      children: [
        TabGenelFirstCard(),
        TabGenelSecondCard(),
      ],
    );
  }
}



