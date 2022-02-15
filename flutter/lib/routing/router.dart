import 'package:flutter/material.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/main_form_body.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/employees.dart';
import 'package:vtys_kalite/screens/Forms/forms_page.dart';
import 'package:vtys_kalite/screens/Settings/settings_page.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  
  switch (settings.name) {
    case employeesPageRoute:
      return _getPageRoute(Employees());
    case mainFormPageRoute:
      return _getPageRoute(MainFormBody());
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
