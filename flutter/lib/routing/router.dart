// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/my_activities.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/employees.dart';
import 'package:vtys_kalite/screens/Forms/forms_page.dart';
import 'package:vtys_kalite/screens/Settings/settings_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  
  switch (settings.name) {
    case employeesPageRoute:
      return _getPageRoute(Employees());
    case myActivitiesPageRoute:
      return _getPageRoute(MyActivities());
    case formsPageRoute:
      return _getPageRoute(FormsPage());
    case settingsPageRoute:
      return _getPageRoute(SettingsPage());
    default:
      print("Check Address on Router.dart");
      return _getPageRoute(Employees());
  }
}

PageRoute _getPageRoute(Widget child) =>
    MaterialPageRoute(builder: (context) => child);
