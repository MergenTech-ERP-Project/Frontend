// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  final List items;
  final Widget navigator;

  const LargeScreen({
    Key? key,
    required this.items,
    required this.navigator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideMenu(
          items: items,
          text: "Mergen Tech",
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - sideMenuWidth,
          child: navigator,
        ),
      ],
    );
  }
}
