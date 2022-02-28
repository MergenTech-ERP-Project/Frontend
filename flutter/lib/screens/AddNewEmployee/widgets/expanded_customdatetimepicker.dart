// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ExpandedCustomDateTimePicker extends StatelessWidget {
  ExpandedCustomDateTimePicker({
    Key? key,
    required this.dateTime,
    required this.label,
  }) : super(key: key);

  DateTime dateTime;
  String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomDateTimePicker(
        suffixWidget: const Icon(Icons.calendar_today_outlined),
        labelText: label,
        borderless: true,
        onChanged: (val) {
          if (val != null) {
            print("DateTime picker : " + val);
          }
          try {
            dateTime = dateTimeFormat.parse(val!);
          } catch (e) {
            print(e.toString());
          }
        },
      ),
    );
  }
}
