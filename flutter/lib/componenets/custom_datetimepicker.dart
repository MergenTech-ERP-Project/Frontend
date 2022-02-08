import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class CustomDateTimePicker extends StatefulWidget {
  late final String? text;
  Function(String?)? onChanged;
  final bool? borderless;
  final Color fillcolor;
  final String? labelText;

  CustomDateTimePicker({
    Key? key,
    this.text,
    required this.onChanged,
    this.borderless,
    this.fillcolor = Colors.white,
    this.labelText,
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
        DateTimePicker(
          type: DateTimePickerType.dateTime,
          initialDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 1000)),
          initialValue: dateTimeFormat.format(DateTime.now()),
          firstDate: DateTime.now(),
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: kTextFontColor,
              fontFamily: 'Comfortaa',
              fontSize: 16,
            ),
            labelText: widget.labelText,
            fillColor: widget.fillcolor,
            border: !widget.borderless!
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                : null,
          ),
          onChanged: widget.onChanged,
          onSaved: widget.onChanged,
        ),
      ],
    );
  }
}
