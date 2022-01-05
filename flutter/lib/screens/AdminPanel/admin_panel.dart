import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class AdminPanelPage extends StatefulWidget {
  static String routeName = '/AdminPanelPage';
  final TextEditingController _searchController = TextEditingController();
  List<User> users = Statics.instance.userController.userList;

  AdminPanelPage({Key? key}) : super(key: key);

  @override
  _AdminPanelPageState createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Expanded(
        child: Obx(() {
          return (widget.users.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: widget.users.length + 1,
                  itemBuilder: (_, index) {
                    return Card(
                      child: index != 0
                          ? buidCard(index)
                          : CustomTextBox(
                              controller: widget._searchController,
                              decorationIcon: const Icon(Icons.search),
                              onTextChanged: (value) {
                                setState(() {
                                  widget.users = Statics
                                      .instance.userController.userList
                                      .where((e) => e.name
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                            ),
                    );
                  },
                ));
        }),
      ),
    );
  }

  Widget buidCard(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          Get.snackbar("${widget.users[index - 1].name}", "",
              snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.symmetric(horizontal: 350));
        });
      },
      child: Text(
        widget.users[index - 1].name,
        style: kLabelThinStyle,
      ),
    );
  }
}
