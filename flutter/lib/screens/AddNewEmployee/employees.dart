// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/employee_card.dart';
import 'package:vtys_kalite/screens/AdminPanel/admin_panel.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class Employees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            return userController.isLoading.value
                ? const CircularProgressIndicator()
                : Row(
                    children: [
                      const Expanded(flex: 1, child: Text("")),
                      Expanded(
                        flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 8,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemCount: userController.userList.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return EmployeeCard(
                                    user: userController.userList[index],
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: CustomButton(
                                        width: double.infinity,
                                        title: 'Yeni Personel',
                                        leftIcon: Icons.person_add,
                                        pressAction: () {
                                          Get.offAllNamed(
                                            employeeRoute + "/new",
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // if (user.title == DepartmentsEnum.management)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: CustomButton(
                                        title: 'Admin Panel',
                                        leftIcon: Icons.admin_panel_settings,
                                        pressAction: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: AdminPanelPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
