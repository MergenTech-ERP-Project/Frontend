import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/LoginPage/login_page.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class MainFormAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  User user;

  MainFormAppBar({
    Key? key,
    required this.user,
  })  : preferredSize = const Size.fromHeight(60),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Obx(() {
        return (Statics.instance.activityController.isLoading.value
            ? const CircularProgressIndicator()
            : Text(
                user.getDepartment(),
                style: kLabelAppBarStyle,
              ));
      }),
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      automaticallyImplyLeading: true,
      centerTitle: true,
      actions: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  user.name,
                  style: kLabelAppBarThinStyle,
                ),
              ],
            ),
          ),
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          },
        )
      ],
    );
  }
}
