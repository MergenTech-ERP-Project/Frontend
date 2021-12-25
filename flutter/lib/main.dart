import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vtys_kalite/controller/shared_preferences_controller.dart';
import 'package:vtys_kalite/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/main_form_page.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/utilities/constants.dart';

import 'core/statics.dart';

Future<void> main() async {
  int? uid = await SharedPreferencesController.getUserId();
  print("shared preferences id: $uid");
  if (uid != null) {
    Statics.instance.userId = uid;
  }
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'VTYS Kalite',
    theme: ThemeData(
    primaryColor: kPrimaryColor,
    backgroundColor: kBackColor,
  ),
    initialRoute: uid == null ? LoginPage.routeName : MainFormPage.routeName,
    routes: routes,
  ));
}
