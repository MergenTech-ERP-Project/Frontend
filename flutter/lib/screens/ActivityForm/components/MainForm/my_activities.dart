import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_list_large.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_list_small.dart';

class MyActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: ActivityListLarge(),
      smallScreen: ActivityListSmall(),
    );
  }
}
