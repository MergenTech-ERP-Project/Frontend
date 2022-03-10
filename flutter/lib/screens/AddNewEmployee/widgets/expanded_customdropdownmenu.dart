// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';

class ExpandedCustomDropDownMenu extends StatelessWidget {
  ExpandedCustomDropDownMenu({
    Key? key,
    required this.label,
    required this.value,
    required this.listExtension,
    required this.onChanged,
  }) : super(key: key);

  String label;
  String value;
  List<String> listExtension;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomDropDownMenu(
          text: label,
          list: listExtension,
          valueChoose: value,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 20,
          isExpandedYes: true,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
