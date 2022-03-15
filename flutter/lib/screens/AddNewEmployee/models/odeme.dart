// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/payment_scheme.dart';
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

  UserHelperController userHelperController;

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
    required this.userHelperController,
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
                  flex: 1,
                  child: CustomText(
                    text: "Ücret:",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomTextBox(
                    borderless: true,
                    label: widget.salary,
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "TL",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: CustomText(
                    text: "Açıklama:",
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomTextBox(
                    borderless: true,
                    label: widget.description,
                  ),
                ),

                ///TODO TODO TODO TODO TODO
                // CustomDropDownMenu(
                //   text: "Periyot",
                //   list: PaymentSchemeExtension.getList(),
                //   valueChoose: widget.userHelperController.userDetailPayment
                //       .paymentScheme.getName,
                //   icon: const Icon(Icons.arrow_drop_down),
                //   iconSize: 20,
                //   isExpandedYes: true,
                //   onChanged: (val) {
                //     setState(() {
                //       widget.userHelperController.userDetailPayment
                //               .paymentScheme =
                //           PaymentSchemeExtension.getEnumFromName(val);
                //     });
                //   },
                // ),
              ],
            ),
            Row(
              children: [
                CustomSwitch(
                  switchValue: widget.grossPrice,
                  text: widget.grossPrice ? "Brüt" : "Net ",
                  onChanged: (bool value) {
                    setState(() {
                      widget.grossPrice = value;
                    });
                  },
                ),
                CustomSwitch(
                  switchValue: widget.includePayroll,
                  text: widget.includePayroll
                      ? "Bodroya Dahil Et  "
                      : "Bodroya Dahil Etme ",
                  onChanged: (bool value) {
                    setState(() {
                      widget.includePayroll = value;
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
