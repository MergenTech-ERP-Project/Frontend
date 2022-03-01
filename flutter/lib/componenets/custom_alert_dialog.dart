import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomAlertDialog extends StatefulWidget {
  final Widget titleWidget, bodyWidget;
  double bodyWidgetWidth;
  double? bodyWidgetHeight;
  List<Widget>? actions;
  Color? backgroundColor;

  CustomAlertDialog({
    required this.titleWidget,
    required this.bodyWidget,
    required this.bodyWidgetWidth,
    this.bodyWidgetHeight,
    this.backgroundColor,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: widget.backgroundColor ?? whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      
      actions: widget.actions,
      title: widget.titleWidget,
      actionsAlignment: MainAxisAlignment.end,
      content: Builder(
        builder: (context) {
          return SizedBox(
            width: widget.bodyWidgetWidth,
            height: widget.bodyWidgetHeight,
            child: widget.bodyWidget,
          );
        },
      ),
    );
  }
}
