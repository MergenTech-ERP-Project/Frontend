import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class CustomSwitch extends StatefulWidget {
  bool switchValue;

  CustomSwitch({
    required this.switchValue,
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
        const Text("Asgari Ücret", style: kLabelStyle)
      ],
    );
  }
}
