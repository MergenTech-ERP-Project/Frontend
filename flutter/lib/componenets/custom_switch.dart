import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';

class CustomSwitch extends StatefulWidget {
  bool switchValue;
  String text;
  final Function(bool) onChanged;

  CustomSwitch({
    required this.switchValue,
    required this.text,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          onChanged: widget.onChanged,
          value: widget.switchValue,
        ),
        CustomText(
          text: widget.text,
        ),
      ],
    );
  }
}
