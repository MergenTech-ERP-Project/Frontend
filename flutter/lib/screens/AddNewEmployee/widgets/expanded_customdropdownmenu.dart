// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';

class ExpandedCustomDropDownMenu extends StatelessWidget {
  ExpandedCustomDropDownMenu({
    Key? key,
    required this.label,
    required this.index,
    required this.listExtension,
  }) : super(key: key);

  String label;
  int index;
  List<String> listExtension;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomDropDownMenu(
        text: label,
        list: listExtension,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 20,
        isExpandedYes: true,
        onChanged: (val) {
          index = listExtension.indexOf(val);
        },
      ),
    );
  }
}
