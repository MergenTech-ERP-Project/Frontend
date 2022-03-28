// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  final Widget navigator;

  const SmallScreen({
    Key? key,
    required this.navigator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: navigator,
    );
  }
}
