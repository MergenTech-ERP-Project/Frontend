// ignore_for_file: must_be_immutable

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomDateTimePicker extends StatelessWidget {
  Function(String?)? onChanged;
  bool? borderless;
  final Color? fillcolor;
  final String? labelText;
  final Widget suffixWidget;
  DateTime? initialDate;

  CustomDateTimePicker({
    Key? key,
    required this.onChanged,
    this.borderless = false,
    this.fillcolor,
    this.labelText,
    this.initialDate,
    this.suffixWidget = const SizedBox(),
  }) : super(key: key) {
    initialDate ??= DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: fillcolor ?? whiteColor,
      child: DateTimePicker(
        type: DateTimePickerType.dateTime,
        initialValue: dateTimeFormat.format(initialDate!),
        initialDate: initialDate,
        firstDate: DateTime(1970),
        lastDate: initialDate!.add(const Duration(days: 1000)),
        decoration: InputDecoration(
          suffixIcon: suffixWidget,
          labelStyle: TextStyle(
            color: blackColor,
            fontFamily: 'Comfortaa',
            fontSize: 16,
          ),
          labelText: labelText,
          border: !borderless!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              : null,
        ),
        onChanged: onChanged,
        onSaved: onChanged,
      ),
    );
  }
}
