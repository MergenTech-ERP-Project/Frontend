import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/controller/shared_preferences_controller.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/Forms/NonWorking_Activity_Daily_Inspection_Form/daily_inspection_form.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/Forms/PermissionRequestForm/permission_request_form.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/Forms/Travel_Assignment_Notification_Form/travel_assignment_notification_form.dart';

import 'components/MainForm/main_form_app_bar.dart';
import 'components/MainForm/main_form_body.dart';
import 'components/MainForm/main_form_drawer.dart';

class MainFormPage extends StatefulWidget {
  static String routeName = '/MainFormPage';

  MainFormPage({Key? key}) : super(key: key);
  final PageController controller = PageController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<MainFormPage> createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  User user = User();

  @override
  Widget build(BuildContext context) {
    Statics.instance.userController.fetchUsers();
    Statics.instance.activityController.fetchActivities();
    return Obx(() {
      user = Statics.instance.userController.userList[Statics.instance.userId!];
      return Statics.instance.userController.isLoading.value
          ? const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              key: widget._scaffoldKey,
              appBar: MainFormAppBar(user: user),
              drawer: MainFormDrawer(
                  scaffoldKey: widget._scaffoldKey,
                  controller: widget.controller),
              body: PageView(
                controller: widget.controller,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  MainFormBody(user: user),
                  TravelAssignmentNotificationFormPage(),
                  PermissionRequestFormPage(),
                  DailyInspectionFormPage(),
                ],
              ),
            );
    });
  }
}
