import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';

class Odeme extends StatefulWidget {
  int id;
  String name;
  int fee;
  String unit;
  String description;
  String periot;
  bool grossPrice;
  bool includePayroll;

  Odeme({
    Key? key,
    this.id = 0,
    required this.name,
    this.fee = 0,
    this.unit = "TL",
    this.description = "",
    this.periot = "",
    this.grossPrice = true,
    this.includePayroll = true,
  }) : super(key: key);

  @override
  _OdemeState createState() => _OdemeState();
}

class _OdemeState extends State<Odeme> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomText(text: widget.name),
    );
  }
}
