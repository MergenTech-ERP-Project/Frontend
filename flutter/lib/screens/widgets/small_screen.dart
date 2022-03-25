// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: localNavigator(),
    );
  }
}
