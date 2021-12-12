import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/controller/activity_controller.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity.dart';

class ActivityFormPage extends StatefulWidget {
  static String routeName = '/ActivityFormPage';

  ActivityFormPage({Key? key}) : super(key: key);

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  static int universal = 0;

  final UserController userController = Get.put(UserController());
  final ActivityController activityController = Get.put(ActivityController());

  //List<String> activityString = ["asd", "qwe", "tyu", "bnm"];

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: ListView.builder(
              itemCount: activityController.activityList.length,
              itemBuilder: (context, index) {
                return buildActivityCard(
                    activityController.activityList[index]);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewActivityPage.routeName, arguments: universal);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Card buildActivityCard(Activity activity) {
    return Card(
      child: ListTile(
          onTap: () {
            setState(() {});
          },
          title: Text(activity.name),
          subtitle: Text(activity.organizator),
          trailing: const Icon(Icons.delete)),
    );
  }
}
