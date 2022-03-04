import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/enums/departments_enum.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AdminPanelPage extends StatefulWidget {
  final TextEditingController _searchController = TextEditingController();
  List<User> users = userController.userList;

  AdminPanelPage({Key? key}) : super(key: key);
  @override
  _AdminPanelPageState createState() => _AdminPanelPageState();
}

int userTitleIndex = 0;

class _AdminPanelPageState extends State<AdminPanelPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightColor,
      width: MediaQuery.of(context).size.width /
          (ResponsiveWidget.isLargeScreen(context) ? 2 : 1.01),
      child: Obx(() {
        return (userController.isLoading.value
            ? const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              )
            : SizedBox(
                height: widget.users.length > 5
                    ? widget.users.length + 1 * 60
                    : 6 * 60,
                child: Column(
                  children: [
                    _SearchBar(
                      searchController: widget._searchController,
                      onTextChanged: (value) {
                        setState(() {
                          widget.users = userController.userList
                              .where((e) => e.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    _ListView(
                      widget: widget,
                    ),
                  ],
                ),
              ));
      }),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final AdminPanelPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: widget.users.length,
        itemBuilder: (_, index) => _UserCard(
          userInfo: widget.users[index],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({
    Key? key,
    required this.searchController,
    required this.onTextChanged,
  }) : super(key: key);

  final TextEditingController searchController;
  final Function(String) onTextChanged;

  @override
  State<_SearchBar> createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: activeColor,
      padding: const EdgeInsets.all(10),
      child: CustomTextBox(
        // search bar
        controller: widget.searchController,
        decorationIcon: const Icon(Icons.search),
        onTextChanged: widget.onTextChanged,
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.userInfo,
  }) : super(key: key);
  final User userInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: activeColor.withOpacity(.2)),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        height: 60,
        child: Center(
          child: CustomText(
            text: userInfo.name,
            size: 18,
          ),
        ),
      ),
      onTap: userInfo.name == user.name
          //users cannot change their own informations
          ? null
          : () {
              userTitleIndex = DepartmentsEnum.values.indexOf(userInfo.title);
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: _AdminDialog(
                    user: userInfo,
                  ),
                ),
              );
              //Navigator.pop(context);
            },
    );
  }
}

class _AdminDialog extends StatelessWidget {
  const _AdminDialog({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightColor,
      width: MediaQuery.of(context).size.width /
          (ResponsiveWidget.isLargeScreen(context) ? 3 : 1.2),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: CustomText(
                text: user.name,
                size: 24,
                weight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: CustomDropDownMenu(
              list: DepartmentsEnumExtension.getList(),
              isExpandedYes: true,
              text: user.title.getName,
              iconSize: 20,
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: (val) {
                userTitleIndex =
                    DepartmentsEnumExtension.getList().indexOf(val);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: CustomButton(
                    title: 'Kaydet',
                    pressAction: () async {
                      showDialogWaitingMessage(context);
                      var title =
                          DepartmentsEnum.values.elementAt(userTitleIndex);
                      user.title = title;
                      await userController.updateUser(user.id, user);
                      Navigator.of(context).pop(true);
                      showDialogDoneMessage(context);
                    },
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 5,
                  child: CustomButton(
                    title: 'Sil',
                    pressAction: () async {
                      showDialogWaitingMessage(context);
                      await userController.deleteUser(user.id);
                      Navigator.of(context).pop(true);
                      showDialogDoneMessage(context,
                          text: "${user.name} silindi!");
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
