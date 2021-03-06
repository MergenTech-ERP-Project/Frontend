import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List<String> list;
  final String text;
  final Icon icon;
  final double iconSize;
  final bool isExpandedYes;
  final Function(String?)? onChanged;
  final String valueChoose;

  const CustomDropDownMenu({
    Key? key,
    required this.list,
    required this.icon,
    this.text = "",
    required this.iconSize,
    required this.isExpandedYes,
    required this.onChanged,
    required this.valueChoose,
  }) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(text: widget.text + ":\t"),
          Expanded(
            child: DropdownButton(
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 16,
                color: blackColor,
                fontWeight: FontWeight.normal,
              ),
              underline: const SizedBox(),
              icon: widget.icon,
              iconSize: widget.iconSize,
              isExpanded: widget.isExpandedYes,
              value: widget.valueChoose,
              onChanged: widget.onChanged,
              items: widget.list
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
