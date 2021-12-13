import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
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

  //List<String> activityString = ["asd", "qwe", "tyu", "bnm"];

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final ActivityController activityController = Get.put(ActivityController());
    universal = ModalRoute.of(context)!.settings.arguments as int;
    print("activityList Size ${activityController.activityList.length}");
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(userController.userList[universal].name)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(child: Obx(() {
          return (activityController.isLoading.value
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200),
                  child: ListView.builder(
                    itemCount: activityController.activityList.length,
                    itemBuilder: (context, index) {
                      return buildActivityCard(
                          activityController.activityList[index]);
                    },
                  ),
                ));
        })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewActivityPage.routeName,
              arguments: universal);
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
