// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/branch_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/company_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/departmant_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/title_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_career_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_detail_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_payment_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_vacation_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/authentication_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/menu_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_diger_bilgiler_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_genel_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_kariyer_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_kisisel_bilgiler_controller.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/optional_company_descriptions_controller.dart';
import 'package:vtys_kalite/screens/page_not_found.dart';
import 'package:vtys_kalite/screens/pages.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/custom_scroll_behaviour.dart';
import 'package:vtys_kalite/utilities/style.dart';

User user = User();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  controllerMethod();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Mergen Tech',
      theme: theme(context),
      initialRoute:
          authenticationController.isLogged() ? rootRoute : loginPageRoute,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => PageNotFound(),
      ),
      getPages: pageList,
    );
  }

  theme(context) => ThemeData(
        scaffoldBackgroundColor: lightColor,
        textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      );
}

controllerMethod() {
  Get.put(AuthenticationController());

  Get.put(UserController());

  Get.put(ActivityController());
  Get.put(ActivityEvaluationController());

  Get.put(CompanyController());
  Get.put(BranchController());
  Get.put(DepartmentController());
  Get.put(TitleController());

  Get.put(MenuController());

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
