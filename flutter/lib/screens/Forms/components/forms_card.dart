import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/Forms/forms.dart';
import 'package:vtys_kalite/utilities/style.dart';

class FormsCard extends StatefulWidget {
  final int index;
  FormsInfo formsInfo;

  FormsCard({
    Key? key,
    required this.index,
    required this.formsInfo,
  }) : super(key: key);

  @override
  _FormsCardState createState() => _FormsCardState();
}

class _FormsCardState extends State<FormsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 5,
                  width: 300,
                  color: widget.formsInfo.formsPageOnTap
                      ? Colors.greenAccent
                      : Colors.redAccent,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: CustomText(
                          text: widget.formsInfo.name,
                          size: 24,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
              backgroundColor: lightColor,
              child: SizedBox(
                width: MediaQuery.of(context).size.width /
                    (ResponsiveWidget.isLargeScreen(context) ? 2 : 1.1),
                child: widget.formsInfo.formPage,
              ),
            ),
          );
        });
      },
    );
  }
}
