import 'package:flutter/material.dart';

class RightIconButton extends StatelessWidget {
  Icon icon;
  Function()? function;
  RightIconButton({
    Key? key,
    required this.icon,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: function,
        child: icon,
      ),
    );
  }
}
