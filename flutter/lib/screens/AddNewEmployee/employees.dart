import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/employee_card.dart';
import 'package:vtys_kalite/screens/AdminPanel/admin_panel.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class Employees extends StatelessWidget {
  const Employees({Key? key}) : super(key: key);

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
                      const Expanded(flex: 1, child: Text("")),
                      Expanded(
                        flex: ResponsiveWidget.isSmallScreen(context) ? 50 : 8,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemCount: userController.userList.length,
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
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: AddNewEmployee(
                                                user: null,
                                              ),
                                            ),
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
                  ));
          },
        ),
      ),
    );
  }
}
