// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee.dart';
import 'package:vtys_kalite/utilities/style.dart';

class EmployeeCard extends StatefulWidget {
  final double? height;
  User user;

  EmployeeCard({
    Key? key,
    this.height = 60,
    required this.user,
  }) : super(key: key);
  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  @override
  Widget build(BuildContext context) {
    int color = randomColor();
    return InkWell(
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: Color(color).withOpacity(.3),
              ),
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: activeColor,
                ),
                child: Center(
                  child: CustomText(
                    text: nameLetters(widget.user.name),
                    size: 16,
                    weight: FontWeight.w100,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: CustomText(
                          text: widget.user.name,
                          size: 22,
                          weight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: CustomText(
                          text: "",

                          ///TODO widget.user.title.getName,
                          size: 20,
                          weight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: AddNewEmployee(
              newUser: widget.user,
            ),
          ),
        );
      },
    );
  }
}
