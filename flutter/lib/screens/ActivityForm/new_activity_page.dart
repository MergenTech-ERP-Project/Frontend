import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/widgets/top_navigation_bar.dart';

import 'components/NewActivity/new_activity_initial_page.dart';
import 'components/NewActivity/new_activity_select_users_page.dart';

class NewActivityPage extends StatefulWidget {
  static String routeName = '/NewActivityPage';

  NewActivityPage({Key? key}) : super(key: key);

  List<User> selectedUsers = <User>[].obs;

  static TextEditingController nameController = TextEditingController();
  static TextEditingController placeController = TextEditingController();
  static TextEditingController organizatorController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static DateTime date = DateTime.now();
  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    NewActivityPage.organizatorController.text = user.name;
    final PageController controller = PageController();
    return Scaffold(
      appBar: topNavigationBar(context, widget._scaffoldKey),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                NewActivityInitialPage(
                  controller: controller,
                ),
                NewActivitySelectUsersPage(
                  widget: widget,
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}