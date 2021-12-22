import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';

class NewActivityNextButton extends StatelessWidget {
  final PageController controller;

  const NewActivityNextButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Next',
      pressAction: () {
        controller.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      },
    );
  }
}