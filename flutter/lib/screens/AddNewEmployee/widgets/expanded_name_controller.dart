import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';

class ExpandedNameController extends StatelessWidget {
  ExpandedNameController({
    Key? key,
    required this.controller,
    required this.label,
    required this.widget,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomTextBox(
          borderless: true,
          controller: controller,
          label: label,
          suffixWidget: widget,
        ),
      ),
    );
  }
}
