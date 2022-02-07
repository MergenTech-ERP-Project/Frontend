import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/employees.dart';
import 'package:vtys_kalite/screens/Forms/NonWorking_Activity_Daily_Inspection_Form/daily_inspection_form.dart';
import 'package:vtys_kalite/screens/Forms/PermissionRequestForm/permission_request_form.dart';
import 'package:vtys_kalite/screens/Forms/Travel_Assignment_Notification_Form/travel_assignment_notification_form.dart';
import 'package:vtys_kalite/screens/Settings/settings_page.dart';
import 'components/MainForm/main_form_app_bar.dart';
import 'components/MainForm/main_form_body.dart';
import 'components/MainForm/main_form_drawer.dart';

class MainFormPage extends StatefulWidget {
  static String routeName = '/MainFormPage';

  MainFormPage({Key? key}) : super(key: key);
  final PageController controller = PageController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  User user = User();

  @override
  State<MainFormPage> createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  @override
  Widget build(BuildContext context) {
    Statics.instance.userController.fetchUsers();
    Statics.instance.activityController.fetchActivities();
    return Obx(() {
      if(Statics.instance.userController.userList.isNotEmpty)
      {
        widget.user = Statics.instance.getUser;
      }
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
              appBar: MainFormAppBar(user: widget.user),
              drawer: MainFormDrawer(
                  scaffoldKey: widget._scaffoldKey,
                  controller: widget.controller),
              body: PageView(
                controller: widget.controller,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Employees(),
                  MainFormBody(user: widget.user),
                  TravelAssignmentNotificationFormPage(),
                  PermissionRequestFormPage(),
                  DailyInspectionFormPage(),
                  SettingsPage(),
                ],
              ),
            );
    });
  }
}
