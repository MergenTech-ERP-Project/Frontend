import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';

class CustomHoverAnimatedButton extends StatefulWidget {
  final Curve curve = Curves.ease;
  final Duration duration = const Duration(milliseconds: 300);
  final Color primaryColor, secondaryColor;
  final String? text;
  final Function()? onTap;
  final double? height, width;

  const CustomHoverAnimatedButton({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
    this.text,
    this.onTap,
    this.height = 50,
    this.width,
  }) : super(key: key);
  @override
  State<CustomHoverAnimatedButton> createState() =>
      CustomHoverAnimatedButtonState();
}

class CustomHoverAnimatedButtonState extends State<CustomHoverAnimatedButton> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => hover = true),
      onTapUp: (_) => setState(() => hover = false),
      onTapCancel: () => setState(() => hover = false),
      child: MouseRegion(
        onHover: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedContainer(
          curve: widget.curve,
          duration: widget.duration,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: hover ? widget.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(widget.height! / 2),
              border: Border.all(
                  color: hover ? widget.secondaryColor : widget.primaryColor)),
          child: Center(
            child: CustomText(
              text: widget.text,
              color: hover ? widget.secondaryColor : widget.primaryColor,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
