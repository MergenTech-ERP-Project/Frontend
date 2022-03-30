// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/utilities/style.dart';

AppBar topNavigationBar(context, key, trailingWidget) => AppBar(
      leading: ResponsiveWidget.isSmallScreen(context)
          ? IconButton(
              icon: Icon(
                Icons.menu,
                color: darkColor,
                size: 24,
              ),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.home_outlined,
                color: darkColor,
                size: 26,
              ),
            ),
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Visibility(
              visible: ResponsiveWidget.isLargeScreen(context),
              child: CustomText(
                text: "Mergen Tech",
                color: darkColor,
                size: 20,
                weight: FontWeight.bold,
              ),
            ),
          ),
          trailingWidget,
        ],
      ),
      iconTheme: IconThemeData(color: darkColor),
      backgroundColor: Colors.transparent,
    );
