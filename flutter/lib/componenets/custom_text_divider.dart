import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomTextDivider extends StatelessWidget {
  final double? height, thickness;
  final String? text;
  final TextStyle? style;
  final Color? color;

  CustomTextDivider({
    Key? key,
    this.height = 40,
    this.thickness = 1,
    this.text = "",
    this.style,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: (Row(
        children: <Widget>[
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Divider(
                  color: color ?? blackColor,
                  height: thickness,
                )),
          ),
          Text(text!, style: style),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                child: Divider(
                  color: color ?? blackColor,
                  height: thickness,
                )),
          ),
        ],
      )),
    );
  }
}
