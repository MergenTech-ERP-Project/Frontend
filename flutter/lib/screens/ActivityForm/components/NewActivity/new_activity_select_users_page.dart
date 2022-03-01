import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/active_to_user.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/NewActivity/components/new_activity_user_card.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class NewActivitySelectUsersPage extends StatefulWidget {
  final Function() onPreviousButtonClick;
  final double containerHeight;
  final double width;
  final int activityId;

  const NewActivitySelectUsersPage({
    Key? key,
    required this.onPreviousButtonClick,
    required this.containerHeight,
    required this.activityId,
    required this.width,
  }) : super(key: key);

  @override
  State<NewActivitySelectUsersPage> createState() =>
      _NewActivitySelectUsersPageState();
}

class _NewActivitySelectUsersPageState
    extends State<NewActivitySelectUsersPage> {
  final TextEditingController _searchController = TextEditingController();

  List<User> users = <User>[].obs;

  List<User> selectedUsers = <User>[].obs;

  var isSearchBar = false.obs;

  @override
  void initState() {
    users.addAll(userController.userList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future postUserListToActivity() async {
      selectedUsers.map((user) => activityController.postActiveToUser(
            ActiveToUser(
              activity_ids: widget.activityId.toInt(),
              user_ids: user.id.toInt(),
            ),
          ));
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return Stack(
      children: [
        SizedBox(
          height: 600,
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: widget.containerHeight + 10),
            child: Obx(
              () => _UserList(
                users: users,
                selectedUsers: selectedUsers,
                containerHeight: widget.containerHeight,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
            height: widget.containerHeight,
            width: widget.width / 1.6,
            child: Obx(() => Visibility(
                  visible: isSearchBar.isFalse,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: CustomButton(
                          height: widget.containerHeight,
                          title: 'Tümünü Ekle',
                          pressAction: () {
                            selectedUsers.addAll(users);
                            users.clear();
                          },
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 10,
                        child: CustomButton(
                          height: widget.containerHeight,
                          title: 'Tümünü Kaldır',
                          pressAction: () {
                            users.addAll(selectedUsers);
                            selectedUsers.clear();
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            height: widget.containerHeight,
            width: widget.width - 28,
            child: Obx(
              () => isSearchBar.value
                  ? CustomTextBox(
                      controller: _searchController,
                      decorationIcon: const Icon(Icons.search),
                      suffixWidget: InkWell(
                        child: Icon(
                          Icons.cancel,
                          color: redColor,
                        ),
                        onTap: () => isSearchBar.value = false,
                      ),
                      onTextChanged: (value) {
                        users = userController.userList
                            .where((e) => e.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      },
                    )
                  : Row(
                      children: [
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  widget.containerHeight / 2),
                              color: activeColor,
                            ),
                            height: widget.containerHeight,
                            width: widget.containerHeight,
                            child: Icon(
                              Icons.search,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () => isSearchBar.value = true,
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: widget.containerHeight,
            width: widget.width - 28,
            color: lightColor,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: CustomButton(
                    height: widget.containerHeight,
                    title: 'Geri',
                    leftIcon: Icons.keyboard_arrow_left,
                    pressAction: widget.onPreviousButtonClick,
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 5,
                  child: CustomButton(
                    height: widget.containerHeight,
                    title: "Tamamla",
                    leftIcon: Icons.done,
                    pressAction: () async {
                      showDialogWaitingMessage(context);
                      await postUserListToActivity();
                      //Future.delayed(const Duration(seconds: 2));
                      showDialogDoneMessage(context, true);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _UserList extends StatefulWidget {
  const _UserList({
    Key? key,
    required this.users,
    required this.selectedUsers,
    required this.containerHeight,
  }) : super(key: key);

  final List<User> users;

  final List<User> selectedUsers;

  final double containerHeight;

  @override
  State<_UserList> createState() => _UserListState();
}

class _UserListState extends State<_UserList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextDivider(
          height: widget.containerHeight,
          text: "Seçilen Personeller",
          thickness: 2,
        ),
        Obx(
          () => SizedBox(
            height: widget.selectedUsers.isEmpty
                ? 50
                : widget.selectedUsers.length * 60,
            child: widget.selectedUsers.isEmpty
                ? Column(
                    children: const [
                      SizedBox(height: 10),
                      CustomText(
                        text: "Seçilen Personel Yok",
                      ),
                      SizedBox(height: 10),
                    ],
                  )
                : SizedBox(
                    height:
                        widget.selectedUsers.length * widget.containerHeight,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 10),
                      itemCount: widget.selectedUsers.length,
                      itemBuilder: (context, index) => InkWell(
                        child: NewActivityUserCard(
                          user: widget.selectedUsers[index],
                          iconData: Icons.remove,
                        ),
                        onTap: () {
                          setState(() {
                            widget.users.add(widget.selectedUsers[index]);
                            widget.selectedUsers
                                .remove(widget.selectedUsers[index]);
                          });
                        },
                      ),
                    ),
                  ),
          ),
        ),
        CustomTextDivider(
          height: widget.containerHeight,
          text: "Personeller",
          thickness: 4,
        ),
        Obx(
          () => userController.isLoading.value
              ? const CircularProgressIndicator()
              : SizedBox(
                  height: widget.users.isEmpty ? 50 : widget.users.length * 60,
                  child: widget.users.isNotEmpty
                      ? ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 10),
                          itemCount: widget.users.length,
                          itemBuilder: (context, index) => InkWell(
                            child: NewActivityUserCard(
                              user: widget.users[index],
                              iconData: Icons.add,
                            ),
                            onTap: () {
                              setState(() {
                                widget.selectedUsers.add(widget.users[index]);
                                widget.users.remove(widget.users[index]);
                              });
                            },
                          ),
                        )
                      : const SizedBox(height: 50),
                ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
