// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/style.dart';

class YeniOdeme extends StatefulWidget {
  int id;
  String name;
  String salary;
  String unit;
  String description;
  String periot;
  bool grossPrice;
  bool includePayroll;

  YeniOdeme({
    Key? key,
    this.id = 0,
    this.name = "",
    this.salary = "",
    this.unit = "",
    this.description = "",
    this.periot = "",
    this.grossPrice = false,
    this.includePayroll = false,
  }) : super(key: key);

  @override
  _YeniOdemeState createState() => _YeniOdemeState();
}

class _YeniOdemeState extends State<YeniOdeme> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  color: redColor,
                  onPressed: () {},
                ),
                CustomText(text: widget.name),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: CustomText(
                    text: "Ücret: \t",
                  ),
                ),
                Expanded(
                  child: CustomTextBox(
                    borderless: true,
                    label: widget.salary,
                  ),
                ),
                CustomSwitch(
                  switchValue: widget.grossPrice,
                  text: widget.grossPrice ? "Brüt" : "Net ",
                  onChanged: (bool value) {
                    setState(() {
                      widget.grossPrice = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
