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

  NewActivitySelectUsersPage({
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
    users.clear();
    selectedUsers.clear();
    users.addAll(userController.userList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: widget.containerHeight + 10),
          child: _UserList(
            users: users,
            selectedUsers: selectedUsers,
            containerHeight: widget.containerHeight,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: _TopButtons(
            users: users,
            width: widget.width,
            isSearchBar: isSearchBar,
            selectedUsers: selectedUsers,
            containerHeight: widget.containerHeight,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: _SearchBar(
            width: widget.width,
            isSearchBar: isSearchBar,
            searchController: _searchController,
            containerHeight: widget.containerHeight,
            onTextChanged: (value) {
              users = userController.userList
                  .where(
                      (e) => e.name.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            },
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: _BottomBar(
            onCreate: () async {
              for (User user in selectedUsers) {
                await activityController.postActiveToUser(
                  ActiveToUser(
                    activityId: widget.activityId,
                    userId: user.id,
                  ),
                );
              }
              await Future.delayed(const Duration(milliseconds: 100));
            },
            width: widget.width,
            containerHeight: widget.containerHeight,
            onPreviousButtonClick: widget.onPreviousButtonClick,
          ),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    Key? key,
    required this.onCreate,
    required this.containerHeight,
    required this.width,
    required this.onPreviousButtonClick,
  }) : super(key: key);

  final Future Function() onCreate;
  final double containerHeight;
  final double width;
  final Function() onPreviousButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: width - 28,
      color: lightColor,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: CustomButton(
              height: containerHeight,
              title: 'Geri',
              leftIcon: Icons.keyboard_arrow_left,
              pressAction: onPreviousButtonClick,
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 5,
            child: CustomButton(
              height: containerHeight,
              title: "Tamamla",
              leftIcon: Icons.done,
              pressAction: () async {
                showDialogWaitingMessage(context);
                await onCreate();
                Navigator.of(context).pop(true);
                showDialogDoneMessage(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
    required this.isSearchBar,
    required this.searchController,
    required this.onTextChanged,
    required this.containerHeight,
    required this.width,
  }) : super(key: key);

  final RxBool isSearchBar;
  final double containerHeight;
  final double width;
  final TextEditingController searchController;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: width - 28,
      child: Obx(
        () => isSearchBar.value
            ? CustomTextBox(
                controller: searchController,
                decorationIcon: const Icon(Icons.search),
                suffixWidget: InkWell(
                  child: Icon(
                    Icons.cancel,
                    color: redColor,
                  ),
                  onTap: () => isSearchBar.value = false,
                ),
                onTextChanged: onTextChanged,
              )
            : Row(
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(containerHeight / 2),
                        color: activeColor,
                      ),
                      height: containerHeight,
                      width: containerHeight,
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
    );
  }
}

class _TopButtons extends StatelessWidget {
  const _TopButtons({
    Key? key,
    required this.isSearchBar,
    required this.selectedUsers,
    required this.users,
    required this.containerHeight,
    required this.width,
  }) : super(key: key);

  final RxBool isSearchBar;
  final List<User> selectedUsers;
  final List<User> users;
  final double containerHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: width / 1.6,
      child: Obx(() => Visibility(
            visible: isSearchBar.isFalse,
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: CustomButton(
                    height: containerHeight,
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
                    height: containerHeight,
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
    );
  }
}

class _UserList extends StatelessWidget {
  const _UserList({
    Key? key,
    required this.users,
    required this.selectedUsers,
    required this.containerHeight,
  }) : super(key: key);

  final List<User> users, selectedUsers;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextDivider(
          height: containerHeight,
          text: "Seçilen Personeller",
          thickness: 2,
        ),
        Obx(
          () => selectedUsers.isEmpty
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
                  height: selectedUsers.length > 7
                      ? 7 * 60
                      : selectedUsers.length * 60,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                    itemCount: selectedUsers.length,
                    itemBuilder: (context, index) => InkWell(
                      child: NewActivityUserCard(
                        user: selectedUsers[index],
                        iconData: Icons.remove,
                      ),
                      onTap: () {
                        users.add(selectedUsers[index]);
                        selectedUsers.remove(selectedUsers[index]);
                      },
                    ),
                  ),
                ),
        ),
        CustomTextDivider(
          height: containerHeight,
          text: "Personeller",
          thickness: 4,
        ),
        Obx(
          () => userController.isLoading.isFalse
              ? SizedBox(
                  height: users.length > 7 ? 7 * 60 : users.length * 60,
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 10),
                      itemCount: users.length,
                      itemBuilder: (context, index) => InkWell(
                        child: NewActivityUserCard(
                          user: users[index],
                          iconData: Icons.add,
                        ),
                        onTap: () {
                          selectedUsers.add(users[index]);
                          users.remove(users[index]);
                        },
                      ),
                    ),
                  ),
                )
              : const CustomText(
                  text: "Personeller...",
                  weight: FontWeight.w100,
                ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
