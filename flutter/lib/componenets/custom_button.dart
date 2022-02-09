import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function()? pressAction;
  final double? height;
  final IconData? icon;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomButton({
    Key? key,
    this.pressAction,
    this.icon,
    this.height = 40,
    required this.title,
    this.backgroundColor = kPrimaryColor,
    this.foregroundColor = Colors.white,
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
          backgroundColor:
              MaterialStateProperty.all<Color>(widget.backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.height! / 2),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                size: 20,
              ),
            Text(
              (widget.icon != null ? "  " : "") + widget.title,
              style: TextStyle(
                color: widget.foregroundColor,
                fontFamily: 'Comfortaa',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
