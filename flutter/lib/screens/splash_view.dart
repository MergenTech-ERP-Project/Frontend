// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';
import 'package:vtys_kalite/routing/router.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/site_layout.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/branch_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/company_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/departmant_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/title_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_career_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_detail_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_payment_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_vacation_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/menu_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/navigator_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_diger_bilgiler_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_genel_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_kariyer_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_kisisel_bilgiler_controller.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/optional_company_descriptions_controller.dart';

class SplashView extends StatelessWidget {
  Future<void> initializeSettings() async {
    await authenticationController.checkLoginStatus();
    await activityController
        .fetchActivities(); //fetchActivityByUserId(user.id);
    controllerMethod();
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: CustomText(
                  text: "Error : ${snapshot.error}",
                ),
              ),
            );
          } else {
            return SiteLayout(
              items: rootSideMenuItems,
              navigator: const LocalNavigator(
                initialRoute: employeesPageRoute,
                generateRoute: rootGenerateRoute,
              ),
              appBarLeadingIcon: Icon(
                Icons.home_outlined,
                color: darkColor,
                size: 24,
              ),
            );
          }
        }
      },
    );
  }

  controllerMethod() {

    Get.put(ActivityController());
    Get.put(ActivityEvaluationController());

    Get.put(CompanyController());
    Get.put(BranchController());
    Get.put(DepartmentController());
    Get.put(TitleController());

    Get.put(MenuController());
    Get.put(NavigatorController());

    Get.put(UserDetailController());
    Get.put(UserDetailCareerController());
    Get.put(UserDetailPaymentController());
    Get.put(UserDetailVacationController());

    Get.put(TabGenelController());
    Get.put(TabKariyerController());
    Get.put(TabDigerBilgilerController());
    Get.put(TabKisiselBilgilerController());

    Get.put(OptionalCompanyDescriptionsController());

    Get.put(UserHelperController());

  }
}
