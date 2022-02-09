import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_diger_bilgiler.dart';

class TabCustomTextBoxUse extends StatelessWidget {
  final TextEditingController controller;
  final Widget widgetIcon;
  final String label;

  const TabCustomTextBoxUse(
      {Key? key,
      required this.controller,
      required this.widgetIcon,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: CustomTextBox(
              borderless: true,
              controller: controller,
              label: label,
            ),
          ),
          Flexible(
            flex: 1,
            child: widgetIcon,
          ),
        ],
      ),
    );
  }
}
