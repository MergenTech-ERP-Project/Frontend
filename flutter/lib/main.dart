import 'package:flutter/material.dart';
import 'package:vtys_kalite/routes.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VTYS Kalite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.routeName,
      routes: routes,
    );
  }
}

