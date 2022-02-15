import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomCheckbox extends StatefulWidget {
  bool value = false;
  String text;
  CustomCheckbox({
    Key? key,
    this.text = "",
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: widget.value,
            activeColor: activeColor,
            onChanged: (val) {
              setState(() {
                widget.value = val!;
              });
            },
          ),
          CustomText(
            text: widget.text,
            color: blackColor,
          ),
        ],
      ),
    );
  }
}
