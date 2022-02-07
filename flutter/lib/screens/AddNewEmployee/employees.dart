import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class Employees extends StatefulWidget {
  Employees({Key? key}) : super(key: key);

  List<User> users = Statics.instance.userController.userList;
  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return (Statics.instance.userController.isLoading.value
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
                                    child: Text(
                                      widget.users[index].name,
                                      style: kLabelThinStyle,
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
                              icon: Icons.person_add,
                              pressAction: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                          ),
                                          title: const Text('User',
                                              style: kLabelHeader2Style),
                                          content: Builder(
                                            builder: (context) {
                                              var width = MediaQuery.of(context)
                                                  .size
                                                  .width;
                                              return Container(
                                                width: width - 20,
                                                child: AddNewEmployee(),
                                              );
                                            },
                                          ),
                                        ));
                                /* Navigator.pushNamed(
                                    context, AddNewEmployee.routeName); */
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(""),
                  ),
                ],
              ));
      }),
    );
  }
}
