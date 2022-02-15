import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomCheckbox extends StatefulWidget {
  bool? value;
  CustomCheckbox({
    Key? key,
    this.value = false,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      activeColor: activeColor,
      onChanged: (val) {
        setState(() {
          widget.value = val;
        });
      },
    );
  }
}
