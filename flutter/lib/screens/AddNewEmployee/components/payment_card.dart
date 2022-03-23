import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/payment_scheme.dart';
import 'package:vtys_kalite/models/User%20Detail/ForCareer/payment.dart';
import 'package:vtys_kalite/utilities/style.dart';

class PaymentCard extends StatefulWidget {
  final Payment newPayment;
  final UserHelperController userHelperController;
  final Function() onPressed;

  const PaymentCard({
    Key? key,
    required this.newPayment,
    required this.userHelperController,
    required this.onPressed,
  }) : super(key: key);

  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
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
                  onPressed: widget.onPressed,
                ),
                CustomText(text: widget.newPayment.name),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: CustomText(
                      text: "Ücret:",
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomTextBox(
                      borderless: true,
                      label: widget.newPayment.salary + "TL",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
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
                      label: widget.newPayment.description,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomDropDownMenu(
                text: "Periyot",
                list: PaymentSchemeExtension.getList(),
                valueChoose: widget.userHelperController.userDetailPayment!
                    .paymentScheme.getName,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 20,
                isExpandedYes: true,
                onChanged: (val) {
                  setState(() {
                    widget.userHelperController.userDetailPayment!
                            .paymentScheme =
                        PaymentSchemeExtension.getEnumFromName(val);
                  });
                },
              ),
            ),
            Row(
              children: [
                CustomSwitch(
                  switchValue: widget.newPayment.grossPrice,
                  text: widget.newPayment.grossPrice ? "Brüt" : "Net ",
                  onChanged: (bool value) {
                    setState(() {
                      widget.newPayment.grossPrice = value;
                    });
                  },
                ),
                CustomSwitch(
                  switchValue: widget.newPayment.includePayroll,
                  text: widget.newPayment.includePayroll
                      ? "Bodroya Dahil Et  "
                      : "Bodroya Dahil Etme ",
                  onChanged: (bool value) {
                    setState(() {
                      widget.newPayment.includePayroll = value;
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
