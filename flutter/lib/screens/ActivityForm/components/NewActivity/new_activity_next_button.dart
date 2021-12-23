import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';

class NewActivityNextButton extends StatelessWidget {
  final PageController controller;
  final newActivityKey;

  const NewActivityNextButton({
    Key? key,
    required this.newActivityKey,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Next',
      pressAction: () {
        bool isValid = newActivityKey.currentState!.validate();
        if(!isValid){
          return;
        }
        newActivityKey.currentState!.save();
        controller.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      },
    );
  }
}