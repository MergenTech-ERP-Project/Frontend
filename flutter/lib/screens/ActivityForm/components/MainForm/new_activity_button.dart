import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/utilities/style.dart';

class NewActivityButton extends StatelessWidget {
  final double? height;
  const NewActivityButton({
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
        height: 80,
        decoration: BoxDecoration(
          color: activeDarkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 22,
            ),
            Flexible(
              child: CustomText(
                text: "  Add New Activity",
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
