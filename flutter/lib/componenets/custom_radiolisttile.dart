// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/style.dart';

class MultipleChoiceRadioListTile extends StatelessWidget {
  final List<String> list;
  final Color? textColor;
  final Function(int?)? onChanged;
  int? groupValue;
  double height;

  MultipleChoiceRadioListTile({
    Key? key,
    required this.list,
    required this.groupValue,
    this.textColor,
    this.onChanged,
    this.height = 50,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      //physics: NeverScrollablePhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: height,
          child: RadioListTile(
            value: index,
            groupValue: groupValue,
            title: CustomText(
              text: list[index].toString(),
              color: textColor,
            ),
            onChanged: onChanged,
            activeColor: activeColor,
          ),
        );
      },
    );
  }
}
