// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';
import 'package:vtys_kalite/routing/router.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/site_layout.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AddNewEmployee extends StatelessWidget {
  final int userId = int.parse(Get.parameters['userId'].toString());

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      appBarLeadingIcon: InkWell(
        onTap: () => Get.offAllNamed(rootRoute),
        child: Icon(
          Icons.keyboard_arrow_left,
          color: darkColor,
          size: 24,
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
              return const LocalNavigator(
                initialRoute: employeePageRoute,
                generateRoute: employeeGenerateRoute,
              );
            }
          }
        },
      ),
    );
  }
}
