// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/style.dart';

class MultipleChoiceRadioListTile extends StatelessWidget {
  final List<String> list;
  final Color? textColor;
  final Function(int?)? onChanged;
  int? groupValue;

  MultipleChoiceRadioListTile({
    Key? key,
    required this.list,
    required this.groupValue,
    this.textColor,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      //physics: NeverScrollablePhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: RadioListTile(
            value: index,
            groupValue: groupValue,
            title: Text(list[index].toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: textColor ?? blackColor)),
            onChanged: onChanged,
            activeColor: activeColor,
          ),
        );
      },
    );
  }
}
