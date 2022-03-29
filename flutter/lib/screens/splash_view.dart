// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
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
    menuController.setActiveItem(employeesPageDisplayName);
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
              trailingWidget: _TrailingWidget(),
            );
          }
        }
      },
    );
  }
}

class _TrailingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: darkColor.withOpacity(.7),
              ),
              onPressed: () {},
            ),
            Positioned(
              top: ResponsiveWidget.isSmallScreen(context) ? 10 : 7,
              right: ResponsiveWidget.isSmallScreen(context) ? 10 : 7,
              child: Container(
                width: 12,
                height: 12,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: lightColor,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: darkColor.withOpacity(.7),
          ),
          onPressed: () {
            Get.offAllNamed(
              employeeRoute + "/" + user.id.toString(),
            );
          },
        ),
        Container(width: 1, height: 22, color: lightGreyColor),
        Visibility(
          visible: !ResponsiveWidget.isSmallScreen(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: CustomText(
                text: user.name,
                color: darkColor,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            menuController.setActiveItem(employeesPageRoute);
            authenticationController.logOut();
            Get.offAllNamed(loginPageRoute);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: lightColor,
                child: CustomText(
                  color: darkColor,
                  text: nameLetters(user.name),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
