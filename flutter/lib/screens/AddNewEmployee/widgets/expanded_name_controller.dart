import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';

class NameController extends StatelessWidget {
  const NameController({
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
    return Padding(
      padding: ResponsiveWidget.isLargeScreen(context)
          ? const EdgeInsets.all(8.0)
          : const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomTextBox(
        borderless: true,
        controller: controller,
        label: label,
        suffixWidget: widget,
        validator: (val) {
          return (val?.length ?? -1) > 0 ? null : "* Gerekli";
        },
      ),
    );
  }
}
