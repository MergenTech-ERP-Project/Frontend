import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
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
          IconButton(
            icon: Icon(
              Icons.settings,
              color: darkColor.withOpacity(.7),
            ),
            onPressed: () {},
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
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: activeColor,
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
          Container(
            width: 1,
            height: 22,
            color: lightGreyColor
          ),
          const SizedBox(width: 24),
          Visibility(
            visible: !ResponsiveWidget.isSmallScreen(context),
            child: Row(
              children: [
                CustomText(
                  text: user.name,
                  color: lightGreyColor,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: lightColor,
                child: Icon(
                  Icons.person_outline,
                  color: darkColor,
                ),
              ),
            ),
          ),
        ],
      ),
      iconTheme: IconThemeData(color: darkColor),
      backgroundColor: Colors.transparent,
    );