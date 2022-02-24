import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';

class textWidget extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  const textWidget({
    Key? key,
    required this.label,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomTextBox(
          borderless: true,
          label: label,
          controller: textEditingController,
          customFontSize: 20,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
