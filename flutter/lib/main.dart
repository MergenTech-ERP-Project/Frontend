import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtys_kalite/routes.dart';
import 'package:vtys_kalite/screens/ActivityForm/main_form_page.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/utilities/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = prefs.getString("username") ?? "";
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'VTYS Kalite',
    theme: ThemeData(
    primaryColor: kPrimaryColor,
    backgroundColor: kBackColor,
  ),
    initialRoute: username == "" ? LoginPage.routeName : MainFormPage.routeName,
    routes: routes,
  ));
}
