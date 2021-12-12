import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/controller/activity_controller.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class NewActivityPage extends StatefulWidget {
  static String routeName = '/NewActivityPage';

  NewActivityPage({Key? key}) : super(key: key);

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  static int universal = 0;

  final UserController userController = Get.put(UserController());
  final ActivityController activityController = Get.put(ActivityController());



  @override
  Widget build(BuildContext context) {
    universal = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(userController.userList[universal].name)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text("asd"),
        ),
      ),
    );
  }
}
