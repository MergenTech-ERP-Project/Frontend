import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';

class ExpandedCustomSwitch extends StatelessWidget {
  const ExpandedCustomSwitch({
    Key? key,
    required this.asgariUcretSwitch,
    required this.text,
  }) : super(key: key);

  final bool asgariUcretSwitch;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSwitch(
        switchValue: asgariUcretSwitch,
        text: text,
      ),
    );
  }
}
