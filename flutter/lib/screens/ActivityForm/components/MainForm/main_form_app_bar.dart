import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class MainFormAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // default is 56.0
  User user;

  MainFormAppBar({
    Key? key,
    required this.user,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Obx(() {
        return (Statics.instance.activityController.isLoading.value
            ? const CircularProgressIndicator()
            : Text(user.name + "  " + user.getDepartmant()));
      }),
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}