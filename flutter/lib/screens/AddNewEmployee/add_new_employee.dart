// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_animated_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';
import 'package:vtys_kalite/routing/router.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/site_layout.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AddNewEmployee extends StatelessWidget {
  String id = Get.parameters['userId'].toString();

  @override
  Widget build(BuildContext context) {
    print(id);
    return id != "new" ? _UpdatePage(userId: int.parse(id)) : _CreatePage();
  }
}

class _UpdatePage extends StatelessWidget {
  final int userId;
  const _UpdatePage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      appBarLeadingIcon: InkWell(
        onTap: () => Get.offAllNamed(rootRoute),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.keyboard_arrow_left,
            color: darkColor,
            size: 26,
          ),
        ),
      ),
      items: employeeSideMenuItems,
      navigator: FutureBuilder(
        future: userHelper.init(id: userId),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return Container(
              color: lightColor,
              child: const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            if (snap.hasError) {
              return Container(
                color: redColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: CustomText(
                        text: snap.error.toString(),
                        size: 24,
                        color: yellowColor,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Stack(
                children: [
                  const LocalNavigator(
                    initialRoute: employeePageRoute,
                    generateRoute: employeeGenerateRoute,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CustomHoverAnimatedButton(
                      height: 50,
                      width: 120,
                      primaryColor: greenColor,
                      secondaryColor: whiteColor,
                      text: "Kaydet",
                      onTap: () => userHelper.userDetailSave(),
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}

class _CreatePage extends StatelessWidget {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60),
            child: /* LocalNavigator(
              initialRoute: employeePageRoute,
              generateRoute: employeeGenerateRoute,
            ), */
                Text("Hata Oluştu burada bakacam"),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: CustomHoverAnimatedButton(
              primaryColor: greenColor,
              secondaryColor: whiteColor,
              height: 50,
              width: pageIndex == employeeSideMenuItems.length - 1 ? 120 : 150,
              text: pageIndex == employeeSideMenuItems.length - 1
                  ? "Kaydet"
                  : "Sonraki",
              onTap: () {
                pageIndex++;
                menuController.changeActiveItem(
                  employeeSideMenuItems[pageIndex].name,
                );
                userHelper.userDetailSave();
                navigatorController.navigateTo(
                  employeeSideMenuItems[pageIndex].route,
                );
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () => Get.offAllNamed(rootRoute),
              child: const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.close,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
