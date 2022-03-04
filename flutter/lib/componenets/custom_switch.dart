import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';

class CustomSwitch extends StatelessWidget {
  bool switchValue;
  String text;
  final Function(bool val) onChanged;

  CustomSwitch({
    required this.switchValue,
    required this.text,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          onChanged: onChanged,
          value: switchValue,
        ),
        CustomText(
          text: text,
        ),
      ],
    );
  }
}
