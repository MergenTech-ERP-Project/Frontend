import 'package:flutter/material.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/main_form_app_bar.dart';

class AdminPage extends StatefulWidget {
  static String routeName = '/AdminPage';

  AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    User user = Statics.instance.userController.userList[Statics.instance.userId!];
    return Scaffold(
      appBar: MainFormAppBar(user: user),
    );
  }
}
