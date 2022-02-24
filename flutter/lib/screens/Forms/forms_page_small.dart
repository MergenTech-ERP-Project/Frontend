import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/Forms/components/forms_card_small.dart';
import 'package:vtys_kalite/screens/Forms/forms.dart';

class FormsPageSmall extends StatefulWidget {
  const FormsPageSmall({Key? key}) : super(key: key);

  @override
  _FormsPageSmallState createState() => _FormsPageSmallState();
}

class _FormsPageSmallState extends State<FormsPageSmall> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: formsList.length,
      itemBuilder: (context, index) => FormsCardSmall(
        context: context,
        formsInfo: formsList[index],
        height: 80,
      ),
    );
  }
}
