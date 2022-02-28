import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/style.dart';

class NewActivityUserCard extends StatelessWidget {
  final User user;
  final IconData iconData;

  const NewActivityUserCard({
    Key? key,
    required this.user,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
          width: 1,
          color: activeColor,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: CustomText(
              text: user.name,
              weight: FontWeight.w300,
              color: blackColor,
              size: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                iconData,
                size: 30,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
