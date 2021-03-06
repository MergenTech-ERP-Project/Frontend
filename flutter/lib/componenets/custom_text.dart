import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  const CustomText({
    Key? key,
    this.text,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontFamily: 'Comfortaa',
        fontSize: size ?? 16,
        color: color ?? blackColor,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
