// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';

class ExpandedCustomDateTimePicker extends StatelessWidget {
  ExpandedCustomDateTimePicker({
    Key? key,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  String label;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomDateTimePicker(
          suffixWidget: const Icon(Icons.calendar_today_outlined),
          labelText: label,
          borderless: true,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
