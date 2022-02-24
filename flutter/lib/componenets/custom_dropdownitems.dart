import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/style.dart';

class MultipleChoiceCustomDropDownItems extends StatefulWidget {
  final List<String> list;
  final String text;
  final Icon icon;
  final double iconSize;
  final bool isExpandedYes;
  final ValueChanged<String> onChanged;

  const MultipleChoiceCustomDropDownItems({
    Key? key,
    required this.list,
    required this.icon,
    this.text = "",
    required this.iconSize,
    required this.isExpandedYes,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MultipleChoiceCustomDropDownItems> createState() =>
      _MultipleChoiceCustomDropDownItemsState();
}

class _MultipleChoiceCustomDropDownItemsState
    extends State<MultipleChoiceCustomDropDownItems> {
  String? valueChoose;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: DropdownButton(
        hint: CustomText(text: widget.text),
        icon: widget.icon,
        iconSize: widget.iconSize,
        isExpanded: widget.isExpandedYes,
        value: valueChoose,
        onChanged: (val) {
          setState(() {
            valueChoose = val.toString();
            widget.onChanged(val.toString());
          });
        },
        items: widget.list
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
      ),
    );
  }
}
