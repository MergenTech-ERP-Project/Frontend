import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class CustomSwitch extends StatefulWidget {
  bool switchValue;
  String text;

  CustomSwitch({
    required this.switchValue,
    required this.text,
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
          onChanged: (bool value) {
            setState(() {
              widget.switchValue = value;
            });
          },
          value: widget.switchValue,
        ),
        Text(widget.text, style: kLabelStyle)
      ],
    );
  }
}
