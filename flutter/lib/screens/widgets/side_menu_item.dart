import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final int color;
  final Function()? onTap;
  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.color,
    this.onTap,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        menuController.onHover(value ? itemName : "not hovering");
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? lightGreyColor.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  child: Container(
                    width: 8,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(color).withOpacity(.4),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: menuController.returnIconFor(itemName),
                ),
                Flexible(
                  child: CustomText(
                    text: itemName,
                    size: menuController.isActive(itemName) ? 24 : 20,
                    weight: menuController.isActive(itemName)
                        ? FontWeight.normal
                        : FontWeight.bold,
                    color: menuController.isHovering(itemName) ||
                            menuController.isActive(itemName)
                        ? darkColor
                        : lightGreyColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
