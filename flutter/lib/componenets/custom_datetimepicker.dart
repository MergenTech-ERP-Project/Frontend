import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class CustomDateTimePicker extends StatefulWidget {
  final String text;
  Function(String?)? onChanged;

  CustomDateTimePicker({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: kLabelStyle),
        const SizedBox(height: 10),
        DateTimePicker(
          type: DateTimePickerType.dateTime,
          initialDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 1000)),
          initialValue: dateTimeFormat.format(DateTime.now()),
          firstDate: DateTime.now(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: widget.onChanged,
          onSaved: widget.onChanged,
        ),
      ],
    );
  }
}
