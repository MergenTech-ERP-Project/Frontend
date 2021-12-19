import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function()? pressAction;
  final double? height;

  const CustomButton({
    Key? key,
    this.pressAction,
    this.height = 40,
    required this.title,
  }) : super(key: key);
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.pressAction,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.height! / 2),
                ))),
        child: Text(widget.title),
      ),
    );
  }
}