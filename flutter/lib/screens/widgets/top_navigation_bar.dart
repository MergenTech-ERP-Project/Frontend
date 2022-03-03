import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

AppBar topNavigationBar(context, key) => AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Container(
              padding: const EdgeInsets.only(left: 14),
              child: Icon(
                Icons.home_outlined,
                color: darkColor,
                size: 24,
              ),
            )
          : IconButton(
              icon: Icon(
                Icons.menu,
                color: darkColor,
                size: 24,
              ),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      elevation: 0,
      title: Row(
        children: [
          Visibility(
            visible: !ResponsiveWidget.isSmallScreen(context),
            child: CustomText(
              text: "Mergen Tech",
              color: darkColor,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(),
          ),
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
            onPressed: () {},
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
              menuController.changeActiveItem(employeesPageRoute);
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
      ),
      iconTheme: IconThemeData(color: darkColor),
      backgroundColor: Colors.transparent,
    );
