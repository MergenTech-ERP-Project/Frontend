import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/controller/user_controller.dart';

class ActivityFormPage extends StatelessWidget {
  static String routeName = '/ActivityFormPage';
  final UserController userController = Get.put(UserController());

  ActivityFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Obx(() {
            if (userController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Text(userController.userList.length.toString());
            }
          }),
        ),
      ),
    );
  }
}
