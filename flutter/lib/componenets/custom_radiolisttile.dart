// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/style.dart';

class MultipleChoiceRadioListTile extends StatefulWidget {
  final List<String> list;
  final Color? textColor;
  int? groupValue;

  MultipleChoiceRadioListTile({
    Key? key,
    required this.list,
    required this.groupValue,
    this.textColor,
  }) : super(key: key);

  @override
  State<MultipleChoiceRadioListTile> createState() =>
      _MultipleChoiceRadioListTileState();
}

class _MultipleChoiceRadioListTileState
    extends State<MultipleChoiceRadioListTile> {
  @override
  void initState() {
    super.initState();
    widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      //physics: NeverScrollablePhysics(),
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: RadioListTile(
            value: index,
            groupValue: widget.groupValue,
            title: Text(widget.list[index].toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: widget.textColor ?? blackColor)),
            onChanged: (val) {
              setState(() {
                widget.groupValue = int.parse(val.toString());
              });
            },
            activeColor: activeColor,
          ),
        );
      },
    );
  }
}
