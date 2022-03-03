import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({
    Key? key,
    required this.label,
    required this.function,
    required this.iptalMi,
  }) : super(key: key);

  final String label;
  Function() function;
  final bool iptalMi;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundColor: iptalMi ? whiteColor : activeColor,
      foregroundColor: iptalMi ? blackColor : whiteColor,
      title: label,
      height: 30,
      width: 120,
      pressAction: function,
    );
  }
}
