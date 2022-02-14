// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/main_form_body.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/employees.dart';
import 'package:vtys_kalite/screens/AdminPanel/admin_panel.dart';
import 'package:vtys_kalite/screens/Forms/forms_page.dart';
import 'package:vtys_kalite/screens/Settings/settings_page.dart';
import 'package:vtys_kalite/screens/SignUp/sign_up.dart';
import 'package:vtys_kalite/screens/loginpage/login_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginPageRoute:
      return _getPageRoute(LoginPage());
    case signUpPageRoute:
      return _getPageRoute(SignUpPage());
    case employeesPageRoute:
      return _getPageRoute(Employees());
    case mainFormPageRoute:
      return _getPageRoute(MainFormBody());
    case formsPageRoute:
      return _getPageRoute(FormsPage());
    case settingsPageRoute:
      return _getPageRoute(SettingsPage());
    case adminPanelPageRoute:
      return _getPageRoute(AdminPanelPage());
    case addNewEmployeePageRoute:
      return _getPageRoute(AddNewEmployee());
    case newActivityPageRoute:
      return _getPageRoute(NewActivityPage());
    case activityEvaluationPageRoute:
      return _getPageRoute(ActivityEvaluationPage());
    default:
      print("Check Address on Router");
      return _getPageRoute(LoginPage());
  }
}

PageRoute _getPageRoute(Widget child) =>
    MaterialPageRoute(builder: (context) => child);
