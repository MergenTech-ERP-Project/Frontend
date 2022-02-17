import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/utilities/style.dart';

class NewActivityButton extends StatelessWidget {
  final double? height;

  List<Widget> _getChildren(context) => [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: ResponsiveWidget.isSmallScreen(context) ? 22 : 30,
          ),
        ),
        const Flexible(
          child: CustomText(
            textAlign: TextAlign.center,
            text: "Add New Activity",
            color: Colors.white,
            size: 20,
          ),
        ),
      ];

  NewActivityButton({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: lightColor,
          child: NewActivityPage(),
        ),
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: activeDarkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _getChildren(context),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _getChildren(context),
              ),
      ),
    );
  }
}
