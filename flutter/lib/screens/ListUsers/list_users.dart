import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class ListUsers extends StatefulWidget {
  static String routeName = '/ListUsersPage';

  ListUsers({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  List<User> users = Statics.instance.userController.userList;
  List<User> selectedUsers = <User>[].obs;
  double containerHeight = 50;

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: Column(
              children: [
                const SizedBox(height: 10),
                searchUser(),
                widget.selectedUsers.isEmpty
                    ? const SizedBox()
                    : CustomTextDivider(
                        height: widget.containerHeight,
                        text: "Selected User",
                        thickness: 2,
                      ),
                SelectedUsersList(),
                CustomTextDivider(
                  height: widget.containerHeight,
                  text: "Users",
                  thickness: 4,
                ),
                UsersList(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Obx SelectedUsersList() {
    return Obx(() {
      return widget.selectedUsers.isEmpty
          ? const SizedBox()
          : Container(
              height: widget.selectedUsers.length * widget.containerHeight,
              child: Expanded(
                child: ListView(
                  children: <Widget>[
                    for (User user in widget.selectedUsers)
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.selectedUsers.remove(user);
                            widget.users.add(user);
                          });
                        },
                        child: TileUsername(user),
                      )
                  ],
                ),
              ),
            );
    });
  }

  Obx UsersList() {
    return Obx(
      () {
        return (Statics.instance.userController.isLoading.value ||
                widget.users.isEmpty
            ? const CircularProgressIndicator()
            : Expanded(
                child: ListView(
                  children: <Widget>[
                    for (var user in widget.users)
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.selectedUsers.add(user);
                            widget.users.remove(user);
                          });
                        },
                        child: TileUsername(user),
                      )
                  ],
                ),
              ));
      },
    );
  }

  Container TileUsername(User user) {
    return Container(
      height: widget.containerHeight,
      child: Padding(
        padding: EdgeInsets.only(
            top: (widget.containerHeight / 2 - 10),
            bottom: (widget.containerHeight / 2 - 10),
            left: (widget.containerHeight)),
        child: Text(user.name),
      ),
    );
  }

  CustomTextBox searchUser() {
    return CustomTextBox(
      controller: widget._searchController,
      decorationIcon: const Icon(Icons.search),
      onTextChanged: (value) {
        setState(() {
          widget.users = Statics.instance.userController.userList
              .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
              .toList();
        });
      },
    );
  }
}
