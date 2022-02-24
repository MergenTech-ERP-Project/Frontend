import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/employee_card.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class Employees extends StatefulWidget {
  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  void initState() {
    super.initState();
    if (userController.isLoading.isFalse) {
      userController.fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            return (userController.isLoading.value
                ? const CircularProgressIndicator()
                : Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(""),
                      ),
                      Expanded(
                        flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 8,
                        child: Stack(
                          children: [
                            ListView.builder(
                              itemCount: userController.userList.length,
                              itemBuilder: (context, index) {
                                return EmployeeCard(
                                  user: userController.userList[index],
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                child: CustomButton(
                                  width: double.infinity,
                                  title: 'New Employee',
                                  leftIcon: Icons.person_add,
                                  pressAction: () =>
                                      Get.toNamed(addNewEmployeePageRoute),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: user.title == DepartmentsEnum.management
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: CustomButton(
                                    title: 'Admin Panel',
                                    leftIcon: Icons.admin_panel_settings,
                                    pressAction: () =>
                                        Get.toNamed(adminPanelPageRoute),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ));
          },
        ),
      ),
    );
  }
}
