import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/utilities/style.dart';

class FirstCardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: activeColor),
                child: Center(
                  child: CustomText(
                    text: nameLetters(user.name),
                    color: whiteColor,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          CustomText(
            text: user.name,
            size: 24,
          ),
          const SizedBox(height: 10),
          Container(
            height: 30,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: const Center(
              child: CustomText(
                text: "Aktif Çalışan",
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
