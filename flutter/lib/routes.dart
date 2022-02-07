import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/main_form_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/screens/AdminPanel/admin_panel.dart';
import 'package:vtys_kalite/screens/Forms/NonWorking_Activity_Daily_Inspection_Form/daily_inspection_form.dart';
import 'package:vtys_kalite/screens/Forms/PermissionRequestForm/permission_request_form.dart';
import 'package:vtys_kalite/screens/Forms/Travel_Assignment_Notification_Form/travel_assignment_notification_form.dart';
import 'package:vtys_kalite/screens/Settings/settings_page.dart';
import 'package:vtys_kalite/screens/SignUp/sign_up.dart';
import 'package:vtys_kalite/screens/loginpage/login_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  MainFormPage.routeName: (context) =>  MainFormPage(),
  AdminPanelPage.routeName: (context) => AdminPanelPage(),
  NewActivityPage.routeName: (context) => NewActivityPage(),
  ActivityEvaluationPage.routeName: (context) =>  ActivityEvaluationPage(),
  PermissionRequestFormPage.routeName: (context) =>  PermissionRequestFormPage(),
  DailyInspectionFormPage.routeName: (context) =>  DailyInspectionFormPage(),
  TravelAssignmentNotificationFormPage.routeName: (context) =>  TravelAssignmentNotificationFormPage(),
  SettingsPage.routeName: (context) => SettingsPage(),
};
