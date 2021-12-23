import 'package:flutter/material.dart';

class CustomTextDivider extends StatelessWidget {
  double? height, thickness;
  String? text;
  CustomTextDivider({
    Key? key,
    this.height = 40,
    this.thickness = 1,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: (
          Row(children: <Widget>[
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: Divider(
                    color: Colors.black,
                    height: thickness,
                  )),
            ),
            Text(text!),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                  child: Divider(
                    color: Colors.black,
                    height: thickness,
                  )),
            ),
          ])
      ),
    );
  }
}