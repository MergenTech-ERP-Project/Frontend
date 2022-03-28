// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/my_activities.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/employees.dart';
import 'package:vtys_kalite/screens/Forms/forms_page.dart';
import 'package:vtys_kalite/screens/Forms/forms_page_small.dart';
import 'package:vtys_kalite/screens/Settings/settings_page.dart';
import 'package:vtys_kalite/screens/VacationRequest/vacation_request.dart';
import 'package:vtys_kalite/utilities/style.dart';

Route<dynamic> rootGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case employeesPageRoute:
      return _getPageRoute(Employees());
    case vacationsPageRoute:
      return _getPageRoute(VacationRequest());
    case myActivitiesPageRoute:
      return _getPageRoute(MyActivities());
    case formsPageRoute:
      return _getPageRoute(
        ResponsiveWidget(
          largeScreen: FormsPage(),
          smallScreen: const FormsPageSmall(),
        ),
      );
    case settingsPageRoute:
      return _getPageRoute(const SettingsPage());
    default:
      print("Check Address on Router.dart");
      return _getPageRoute(Employees());
  }
}

Route<dynamic> employeeGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case employeePageRoute:
      return _getPageRoute(Container(color: redColor));
    case careerPageDisplayName:
      return _getPageRoute(Container(color: greenColor));
    case vacationRequestPageDisplayName:
      return _getPageRoute(Container(color: yellowColor));
    case otherPageDisplayName:
      return _getPageRoute(Container(color: activeDarkColor));

    default:
      print("Check Address on Router.dart");
      return _getPageRoute(Container(color: redColor));
  }
}

PageRoute _getPageRoute(Widget child) =>
    MaterialPageRoute(builder: (context) => child);
