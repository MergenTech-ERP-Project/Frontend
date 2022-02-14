import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee.dart';
import 'package:vtys_kalite/screens/AdminPanel/admin_panel.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class Employees extends StatefulWidget {
  List<User> users = userController.userList;
  User user = User();

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return (userController.isLoading.value
            ? const CircularProgressIndicator()
            : Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(""),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: widget.users.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: InkWell(
                                child: SizedBox(
                                  height: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 20),
                                    child: CustomText(
                                      text: widget.users[index].name,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: CustomButton(
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
                    child: widget.user.title == DepartmentsEnum.management
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
      }),
    );
  }
}
