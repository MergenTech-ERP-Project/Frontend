import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';

class NewActivityNextButton extends StatelessWidget {
  final PageController controller;
  final bool isValid;

  const NewActivityNextButton({
    Key? key,
    required this.isValid,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Next',
      pressAction: () {
        if (!isValid) {
          return;
        }
        controller.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
        );
      },
    );
  }
}
