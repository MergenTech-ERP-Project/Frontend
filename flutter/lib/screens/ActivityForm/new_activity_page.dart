import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/new_activity_initial_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/new_activity_select_users_page.dart';
import 'package:vtys_kalite/utilities/style.dart';

class NewActivityPage extends StatelessWidget {
  NewActivityPage({
    Key? key,
    this.activity,
  }) : super(key: key) {
    activityId.value = activity != null ? activity!.id : 0;
  }

  Activity? activity;
  var activityId = 0.obs;
  var page = 0.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width =
        ResponsiveWidget.isSmallScreen(context) ? size.width : size.width / 1.6;
    return AnimatedContainer(
      color: lightColor,
      width: width,
      duration: const Duration(milliseconds: 500),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Obx(() => page.value == 0
                ? NewActivityInitialPage(
                    activity: activity,
                    onNextButtonClick: (activity) {
                      page.value = 1;
                      activityId.value = activity.id;
                    },
                  )
                : NewActivitySelectUsersPage(
                    width: width - 12,
                    onPreviousButtonClick: () {
                      page.value = 0;
                    },
                    containerHeight: 40,
                    activityId: activityId.value,
                  )),
          ),
        ],
      ),
    );
  }
}
