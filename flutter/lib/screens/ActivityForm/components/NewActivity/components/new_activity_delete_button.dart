import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class ActivityCardDeleteButton extends StatelessWidget {
  const ActivityCardDeleteButton({
    Key? key,
    required this.size,
    required this.activity,
  }) : super(key: key);
  final double size;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Icon(
          Icons.delete,
          color: Colors.redAccent,
          size: size,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
            backgroundColor: lightGreyColor,
            titleWidget: Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  size: 24,
                  color: yellowColor,
                ),
                CustomText(
                  text: "Dikkat",
                  size: 24,
                  color: yellowColor,
                ),
              ],
            ),
            bodyWidget: Wrap(
              children: const [
                Center(
                  child: CustomText(
                    text: "Silmek istediğinizden emin misiniz?",
                    size: 18,
                    weight: FontWeight.w200,
                  ),
                ),
              ],
            ),
            bodyWidgetWidth: 350,
            actions: [
              Row(
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.close,
                            color: whiteColor,
                          ),
                          CustomText(
                            text: "Hayır",
                            color: whiteColor,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.done,
                            color: yellowColor,
                          ),
                          CustomText(
                            text: "Evet",
                            color: yellowColor,
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      showDialogWaitingMessage(context);
                      await activityController.deleteActivity(activity.id);
                      Navigator.of(context).pop(true);
                      showDialogDoneMessage(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
