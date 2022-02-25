import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityEvaluationPage extends StatefulWidget {
  final Activity activity;
  final Future onSave;

  ActivityEvaluationPage({
    Key? key,
    required this.activity,
    required this.onSave,
  }) : super(key: key);

  final TextEditingController _evaluationController = TextEditingController();

  @override
  _ActivityEvaluationPageState createState() => _ActivityEvaluationPageState();
}

class _ActivityEvaluationPageState extends State<ActivityEvaluationPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DateTime date = dateTimeFormat.parse(widget.activity.datetime);
    return Container(
      color: lightColor,
      width: ResponsiveWidget.isSmallScreen(context) ? width : width / 1.6,
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomText(
                    text: widget.activity.name.capitalizeFirst,
                    color: blackColor,
                    size: 28,
                    weight: FontWeight.w400,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                          color: blackColor,
                        ),
                      ),
                      CustomText(
                        text: "${date.day}.${date.month}.${date.year}",
                        color: blackColor,
                        size: 18,
                        weight: FontWeight.w200,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  text: "Kullanıcı Adı: ",
                                  color: blackColor,
                                  size: 20,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: CustomText(
                                  text: user.name,
                                  color: blackColor,
                                  size: 18,
                                  weight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  text: "Organizatör: ",
                                  color: blackColor,
                                  size: 20,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: CustomText(
                                  text: widget.activity.organizator,
                                  color: blackColor,
                                  size: 18,
                                  weight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          evaluationContainer(),
                          const SizedBox(height: 20),
                          saveCustomButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget saveCustomButton(BuildContext context) {
    return Center(
      child: CustomButton(
        width: double.infinity,
        height: 40,
        title: "Kaydet",
        pressAction: () async {
          await activityEvaluationController.postActivityEvaluation(
              widget.activity.id, user.id, widget._evaluationController.text);
          await widget.onSave;
          Get.back();
        },
      ),
    );
  }

  Widget evaluationContainer() {
    return Container(
      color: whiteColor,
      height: 100,
      child: TextFormField(
        controller: widget._evaluationController,
        textAlign: TextAlign.start,
        maxLines: null,
        minLines: null,
        expands: true,
        decoration: const InputDecoration(
          hintText: "Değerlendirme...",
        ),
      ),
    );
  }
}
