import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final Widget titleWidget, bodyWidget;
  double bodyWidgetWidth;

  CustomAlertDialog({
    required this.titleWidget,
    required this.bodyWidget,
    required this.bodyWidgetWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      title: widget.titleWidget,
      content: Builder(
        builder: (context) {
          return SizedBox(
            width: widget.bodyWidgetWidth,
            child: widget.bodyWidget,
          );
        },
      ),
    );
  }
}
