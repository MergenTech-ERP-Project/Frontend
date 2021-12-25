import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';

class ListUsers extends StatefulWidget {
  static String routeName = '/ListUsersPage';

  List<User>? selectedUsers;

  ListUsers({
    Key? key,
    this.selectedUsers,
  }) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  List<User> users = <User>[].obs;
  double containerHeight = 50;

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  void initState() {
    widget.users.clear();
    for (User user in Statics.instance.userController.userList) {
      if(!widget.selectedUsers!.contains(user)) {
        widget.users.add(user);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(flex: 2, child: searchUser()),
              const SizedBox(width: 5),
              Expanded(flex: 1, child: addAllButton()),
              const SizedBox(width: 5),
              Expanded(flex: 1, child: removeAllButton()),
            ],
          ),
          widget.selectedUsers!.isEmpty
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
    );
  }

  CustomButton removeAllButton() {
    return CustomButton(
                title: 'Remove All',
                pressAction: () {
                  setState(() {
                    for(User user in widget.selectedUsers!){
                      widget.users.add(user);
                    }
                    widget.selectedUsers!.clear();
                  });
                },
              );
  }

  CustomButton addAllButton() {
    return CustomButton(
                title: 'Add All',
                pressAction: () {
                  setState(() {
                    for(User user in widget.users){
                      widget.selectedUsers!.add(user);
                    }
                    widget.users.clear();
                  });
                },
              );
  }

  Widget SelectedUsersList() {
    return Obx(() {
      return widget.selectedUsers!.isEmpty
          ? const SizedBox()
          : Container(
              height: widget.selectedUsers!.length * widget.containerHeight,
              child: Expanded(
                child: ListView(
                  children: <Widget>[
                    for (User user in widget.selectedUsers!)
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.selectedUsers!.remove(user);
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

  Widget UsersList() {
    return Expanded(
      child: Obx(
        () {
          return (Statics.instance.userController.isLoading.value
              ? const CircularProgressIndicator()
              : widget.users.isNotEmpty
                  ? ListView(
                    children: <Widget>[
                      for (var user in widget.users)
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.selectedUsers!.add(user);
                              widget.users.remove(user);
                            });
                          },
                          child: TileUsername(user),
                        )
                    ],
                  )
                  : const SizedBox(height: 50));
        },
      ),
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
