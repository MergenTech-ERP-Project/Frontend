import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/branch_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/company_controller.dart';
import 'package:vtys_kalite/controller/Backend%20Controller/user_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/menu_controller.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/navigator_controller.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/page_not_found.dart';
import 'package:vtys_kalite/screens/pages.dart';
import 'package:vtys_kalite/utilities/custom_scroll_behaviour.dart';
import 'package:vtys_kalite/utilities/style.dart';

User user = User();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString("username");

  user.name = username ?? "";

  Get.put(UserController());
  Get.put(ActivityController());
  Get.put(ActivityEvaluationController());
  Get.put(CompanyController());
  Get.put(BranchController());
  Get.put(MenuController());
  Get.put(NavigatorController());
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
      initialRoute: user.name == "" ? loginPageRoute : rootRoute,
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
