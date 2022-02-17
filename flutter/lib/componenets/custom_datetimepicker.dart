import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomDateTimePicker extends StatefulWidget {
  Function(String?)? onChanged;
  bool? borderless;
  final Color? fillcolor;
  final String? labelText;
  final Widget suffixWidget;

  CustomDateTimePicker({
    Key? key,
    required this.onChanged,
    this.borderless = false,
    this.fillcolor,
    this.labelText,
    this.suffixWidget = const SizedBox(),
  }) : super(key: key);

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.fillcolor ?? whiteColor,
      child: DateTimePicker(
        type: DateTimePickerType.dateTime,
        initialValue: dateTimeFormat.format(DateTime.now()),
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 1000)),
        decoration: InputDecoration(
          suffixIcon: widget.suffixWidget,
          labelStyle: TextStyle(
            color: blackColor,
            fontFamily: 'Comfortaa',
            fontSize: 16,
          ),
          labelText: widget.labelText,
          border: !widget.borderless!
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              : null,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onChanged,
      ),
    );
  }
}
