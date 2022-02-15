import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class ListUsers extends StatefulWidget {
  final TextEditingController _searchController = TextEditingController();
  List<User> users = <User>[].obs;
  List<User> selectedUsers = <User>[].obs;
  double containerHeight = 60;

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  ///init state get selected users
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.users.addAll(userController.userList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 2, child: searchUser()),
            const SizedBox(width: 10),
            Expanded(flex: 1, child: addAllButton()),
            const SizedBox(width: 10),
            Expanded(flex: 1, child: removeAllButton()),
          ],
        ),
        CustomTextDivider(
          height: widget.containerHeight,
          text: "Selected User",
          thickness: 2,
        ),
        Obx(
          () => widget.selectedUsers.isEmpty
              ? Column(
                  children: const [
                    SizedBox(height: 10),
                    CustomText(
                      text: "No Selected Users",
                    ),
                    SizedBox(height: 10),
                  ],
                )
              : selectedUsersList(),
        ),
        CustomTextDivider(
          height: widget.containerHeight,
          text: "Users",
          thickness: 4,
        ),
        usersList(),
        const SizedBox(height: 50),
      ],
    );
  }

  CustomButton removeAllButton() {
    return CustomButton(
      title: 'Remove All',
      pressAction: () {
        widget.users.addAll(widget.selectedUsers);
        widget.selectedUsers.clear();
      },
    );
  }

  CustomButton addAllButton() {
    return CustomButton(
      title: 'Add All',
      pressAction: () {
        widget.selectedUsers.addAll(widget.users);
        widget.users.clear();
      },
    );
  }

  Widget selectedUsersList() {
    return SizedBox(
      height: widget.selectedUsers.length * widget.containerHeight,
      child: ListView(
        children: <Widget>[
          for (User user in widget.selectedUsers)
            InkWell(
              onTap: () {
                widget.selectedUsers.remove(user);
                widget.users.add(user);
              },
              child: tileUsername(user, Icons.remove),
            )
        ],
      ),
    );
  }

  Widget usersList() {
    return Obx(
      () {
        return (userController.isLoading.value
            ? const CircularProgressIndicator()
            : widget.users.isNotEmpty
                ? ListView(
                    children: <Widget>[
                      for (var user in widget.users)
                        InkWell(
                          onTap: () {
                            widget.selectedUsers.add(user);
                            widget.users.remove(user);
                          },
                          child: tileUsername(user, Icons.add),
                        )
                    ],
                  )
                : const SizedBox(height: 50));
      },
    );
  }

  Container tileUsername(User user, IconData icon) {
    return Container(
      height: widget.containerHeight,
      child: Padding(
        padding: EdgeInsets.only(
            top: (widget.containerHeight / 16), left: (widget.containerHeight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: user.name,
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  CustomTextBox searchUser() {
    return CustomTextBox(
      controller: widget._searchController,
      decorationIcon: const Icon(Icons.search),
      onTextChanged: (value) {
        widget.users = userController.userList
            .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      },
    );
  }
}
