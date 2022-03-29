import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/style.dart';

class MenuController extends GetxController {
  var activeItem = employeesPageDisplayName.obs;
  var hoverItem = "".obs;

  setActiveItem(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  bool isActive(String itemName) => activeItem.value == itemName;
  bool isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    IconData iconData;
    switch (itemName) {
      case employeesPageDisplayName:
        iconData = Icons.person;
        break;
      case myActivitiesPageDisplayName:
        iconData = Icons.event;
        break;
      case vacationsPageDisplayName:
        iconData = Icons.event_note;
        break;
      case formsPageDisplayName:
        iconData = Icons.event_note;
        break;
      case settingsPageDisplayName:
        iconData = Icons.settings;
        break;
      case employeePageDisplayName:
        iconData = Icons.person;
        break;
      case careerPageDisplayName:
        iconData = Icons.wallet_membership;
        break;
      case vacationRequestPageDisplayName:
        iconData = Icons.event_note;
        break;
      case otherPageDisplayName:
        iconData = Icons.ac_unit;
        break;
      default:
        iconData = Icons.exit_to_app;
        break;
    }
    return _customIcon(iconData, itemName);
  }

  Widget _customIcon(IconData iconData, String itemName) {
    return Icon(iconData,
        size: isActive(itemName) ? 22 : 18,
        color: isActive(itemName) || isHovering(itemName)
            ? darkColor
            : lightGreyColor);
  }
}
