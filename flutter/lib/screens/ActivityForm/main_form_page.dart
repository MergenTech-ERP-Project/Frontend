import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/new_activity_page.dart';
import 'package:vtys_kalite/utilities/constans.dart';

import 'components/MainForm/main_form_app_bar.dart';
import 'components/MainForm/main_form_body.dart';
import 'components/MainForm/main_form_drawer.dart';

class MainFormPage extends StatefulWidget {
  static String routeName = '/ActivityFormPage';

  MainFormPage({Key? key}) : super(key: key);
  User user = Statics.instance.userController.userList[Statics.instance.userId];

  @override
  State<MainFormPage> createState() => _MainFormPageState();
}

class _MainFormPageState extends State<MainFormPage> {
  @override
  Widget build(BuildContext context) {
    Statics.instance.userController.fetchUsers();
    Statics.instance.activityController.fetchActivities();

    print(
        "activityList Size ${Statics.instance.activityController.activityList.length}");
    return Scaffold(
      appBar: MainFormAppBar(user: widget.user),
      drawer: const MainFormDrawer(),
      body: MainFormBody(user: widget.user),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewActivityPage.routeName);
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}