// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/my_activities.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/employee_page.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/employees.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_izin.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kariyer.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kariyer_small.dart';
import 'package:vtys_kalite/screens/Forms/forms_page.dart';
import 'package:vtys_kalite/screens/Forms/forms_page_small.dart';
import 'package:vtys_kalite/screens/Settings/settings_page.dart';
import 'package:vtys_kalite/screens/VacationRequest/vacation_request.dart';

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
      return _getPageRoute(EmployeePage());
    case careerPageRoute:
      return _getPageRoute(ResponsiveWidget(
        largeScreen: TabKariyer(),
        smallScreen: TabKariyerSmall(),
      ));
    case vacationRequestPageRoute:
      return _getPageRoute(TabIzin());
    case otherPageRoute:
      return _getPageRoute(const Center(
        child: CustomText(
          text: "...",
          size: 50,
        ),
      ));

    default:
      print("Check Address on Router.dart");
      return _getPageRoute(EmployeePage());
  }
}

PageRoute _getPageRoute(Widget child) =>
    MaterialPageRoute(builder: (context) => child);
