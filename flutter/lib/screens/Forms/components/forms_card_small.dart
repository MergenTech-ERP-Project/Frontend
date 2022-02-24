import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/Forms/forms.dart';
import 'package:vtys_kalite/utilities/style.dart';

class FormsCardSmall extends StatefulWidget {
  final double? height;
  final BuildContext context;
  FormsInfo formsInfo;
  FormsCardSmall({
    Key? key,
    this.height,
    required this.context,
    required this.formsInfo,
  }) : super(key: key);

  @override
  _FormsCardSmallState createState() => _FormsCardSmallState();
}

class _FormsCardSmallState extends State<FormsCardSmall> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: widget.formsInfo.formsPageOnTap
                          ? Colors.greenAccent
                          : Colors.redAccent,
                    ),
                    width: 8,
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 50,
                  height: widget.height,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CustomText(
                            text: widget.formsInfo.name,
                            size: 24,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
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
        )
      ],
    );
  }
}
