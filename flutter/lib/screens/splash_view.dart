// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';
import 'package:vtys_kalite/routing/router.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/site_layout.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class SplashView extends StatelessWidget {
  Future<void> initializeSettings() async {
    await authenticationController.checkLoginStatus();
    await activityController
        .fetchActivities(); //fetchActivityByUserId(user.id);
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
              appBarLeadingIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.home_outlined,
                  color: darkColor,
                  size: 26,
                ),
              ),
            );
          }
        }
      },
    );
  }
}
