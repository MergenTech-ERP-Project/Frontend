import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/main_form_app_bar.dart';
import 'package:vtys_kalite/screens/ActivityForm/components/MainForm/main_form_drawer.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class AdminPanelPage extends StatefulWidget {
  static String routeName = '/AdminPanelPage';
  final TextEditingController _searchController = TextEditingController();
  List<User> users = Statics.instance.userController.userList;

  AdminPanelPage({Key? key}) : super(key: key);
  @override
  _AdminPanelPageState createState() => _AdminPanelPageState();
}

int userTitleIndex = 0;

class _AdminPanelPageState extends State<AdminPanelPage> {
  List<String> titlesDepartmant = [];

  @override
  Widget build(BuildContext context) {
    print("Heelllloooo " + Statics.instance.getUser.name);
    for (var departmant in DepartmentsEnum.values) {
      titlesDepartmant.add(EnumToString.convertToString(departmant));
    }
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MainFormAppBar(user: Statics.instance.getUser),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
          child: Obx(() {
            return (Statics.instance.userController.isLoading.value
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: widget.users.length + 1,
                    itemBuilder: (_, index) {
                      return Card(
                        child: index == 0
                            ? CustomTextBox(
                                // search bar
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
                              )
                            : UserCard(index, screenSize.width / 2),
                      );
                    },
                  ));
          }),
        ),
      ),
    );
  }

  Widget UserCard(int index, width) {
    return InkWell(
      onTap: widget.users[index - 1].name == Statics.instance.username
          //users cannot change their own informations
          ? null
          : () {
              userTitleIndex =
                  DepartmentsEnum.values.indexOf(widget.users[index - 1].title);
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        title: const Text('User', style: kLabelHeader2Style),
                        content: Builder(
                          builder: (context) {
                            var width = MediaQuery.of(context).size.width;
                            return Container(
                              width: width / 3,
                              height: 200,
                              child: Column(
                                children: [
                                  const Divider(
                                    height: 10,
                                    thickness: 2,
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      widget.users[index - 1].name,
                                      style: kLabelStyle,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  MultipleChoiceCustomDropDownItems(
                                    list: titlesDepartmant,
                                    isExpandedYes: true,
                                    text:
                                        widget.users[index - 1].getDepartment(),
                                    iconSize: 20,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (val) {
                                      userTitleIndex =
                                          titlesDepartmant.indexOf(val);
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: saveButton(context, index),
                                      ),
                                      const Expanded(
                                        flex: 1,
                                        child: SizedBox(width: 1),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: deleteButton(context, index),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ));
              //Navigator.pop(context);
            },
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20),
          child: Text(
            widget.users[index - 1].name,
            style: kLabelThinStyle,
          ),
        ),
      ),
    );
  }

  CustomButton deleteButton(context, int index) {
    return CustomButton(
      title: 'Delete',
      pressAction: () async {
        print(widget.users[index - 1].id);
        await Statics.instance.userController
            .deleteUser(widget.users[index - 1].id);
        Navigator.pop(context);
      },
    );
  }

  CustomButton saveButton(context, int index) {
    return CustomButton(
      title: 'Save',
      pressAction: () async {
        print(widget.users[index - 1].id);
        var title = DepartmentsEnum.values.elementAt(userTitleIndex);
        await Statics.instance.userController.putUser(
            widget.users[index - 1].id,
            User(
                id: widget.users[index - 1].id,
                name: widget.users[index - 1].name,
                title: title,
                password: widget.users[index - 1].password));
        Navigator.pop(context);
      },
    );
  }
}
