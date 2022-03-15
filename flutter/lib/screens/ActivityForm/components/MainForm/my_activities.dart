// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_list_large.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/activity_list_small.dart';

class MyActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: ActivityListLarge(),
      smallScreen: ActivityListSmall(),
    );
  }
}
