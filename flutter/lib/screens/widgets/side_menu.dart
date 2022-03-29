// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/widgets/side_menu_item.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

const double sideMenuWidth = 300;

class SideMenu extends StatelessWidget {
  final List items;
  final String text;

  const SideMenu({
    Key? key,
    required this.items,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightColor,
      width: sideMenuWidth,
      child: ListView(
        children: [
          Visibility(
            visible: ResponsiveWidget.isSmallScreen(context),
            child: Container(
              color: activeDarkColor,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 50.0),
                child: CustomText(
                  text: text,
                  color: lightColor,
                  size: 30,
                  weight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: items
                .map((item) => SideMenuItem(
                      itemName: item.name,
                      color: item.color,
                      onTap: () {
                        if (!menuController.isActive(item.name)) {
                          menuController.setActiveItem(item.name);
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();
                          }
                          navigatorController.navigateTo(item.route);
                        }
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
