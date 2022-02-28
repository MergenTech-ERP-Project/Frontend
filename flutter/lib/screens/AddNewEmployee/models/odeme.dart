import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/style.dart';

class YeniOdeme extends StatefulWidget {
  int id;
  String? name;
  String? salary;
  String? unit;
  String? description;
  String? periot;
  bool? grossPrice;
  bool? includePayroll;

  YeniOdeme({
    Key? key,
    this.id = 0,
    this.name,
    this.salary,
    this.unit,
    this.description,
    this.periot,
    this.grossPrice,
    this.includePayroll,
  }) : super(key: key) {
    name ??= "";
    salary ??= "";
    unit ??= "";
    description ??= "";
    periot ??= "";
    salary ??= "";
    grossPrice ??= true;
    includePayroll ??= true;
  }

  @override
  _YeniOdemeState createState() => _YeniOdemeState();
}

class _YeniOdemeState extends State<YeniOdeme> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              const CustomText(
                text: "Ücret: \t",
              ),
              const SizedBox(width: 10),
              CustomTextBox(
                borderless: true,
                label: widget.salary,
              ),
              const CustomText(
                text: "Ücret: \t",
              ),
              const SizedBox(width: 10),
              CustomTextBox(
                borderless: true,
                label: widget.salary,
              ),
            ],
          ),
          CustomSwitch(
            switchValue: widget.grossPrice!,
            text: widget.grossPrice! ? "Brüt" : "Net",
          ),
        ],
      ),
    );
  }
}
