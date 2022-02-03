import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';

class NewActivityPreviousButton extends StatelessWidget {
  const NewActivityPreviousButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Previous',
      pressAction: () {
        controller.previousPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
        );
      },
    );
  }
}