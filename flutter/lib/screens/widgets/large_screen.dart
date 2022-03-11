// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';
import 'package:vtys_kalite/screens/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideMenu(),
        SizedBox(
          width: MediaQuery.of(context).size.width - sideMenuWidth,
          child: localNavigator(),
        ),
      ],
    );
  }
}
