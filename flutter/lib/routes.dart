import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_evaluation_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_form_page.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/screens/SignUp/sign_up.dart';
import 'package:vtys_kalite/screens/ListUsers/list_users.dart';
import 'package:vtys_kalite/screens/loginpage/login_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  ActivityFormPage.routeName: (context) =>  ActivityFormPage(),
  NewActivityPage.routeName: (context) =>  NewActivityPage(),
  ActivityEvaluationPage.routeName: (context) =>  ActivityEvaluationPage(),
  ListUsers.routeName: (context) => ListUsers(),
};
