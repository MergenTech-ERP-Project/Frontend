import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/style.dart';

class EmployeeCard extends StatefulWidget {
  final double? height;
  final User user;

  const EmployeeCard({
    Key? key,
    this.height = 60,
    required this.user,
  }) : super(key: key);
  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  randomColor() {
    return (Random().nextDouble() * 0xFFFFFF).toInt();
  }
  @override
  Widget build(BuildContext context) {
    int color = randomColor();
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Color(color).withOpacity(.25),
                    ),
                    width: 8,
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 50,
                  height: widget.height,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomText(
                            text: widget.user.name,
                            size: 22,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      CustomText(
                        text: widget.user.getDepartment(),
                        size: 20,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
