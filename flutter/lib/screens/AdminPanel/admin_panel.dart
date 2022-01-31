import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
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

int userTitleIndex = 0;

class _AdminPanelPageState extends State<AdminPanelPage> {
  List<String> titles = [];
  @override
  Widget build(BuildContext context) {
    for (var departmant in Departments.values) {
      titles.add(EnumToString.convertToString(departmant));
    }
    var screenSize = MediaQuery.of(context).size;
    return Center(
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
                          : buidCard(index, screenSize.width / 2),
                    );
                  },
                ));
        }),
      ),
    );
  }

  Widget buidCard(int index, width) {
    return InkWell(
      onTap: () {
        setState(() async {
          userTitleIndex = Departments.values.indexOf(widget.users[index - 1].title);
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: const Text('User', style: kLabelHeader2Style),
                content: Builder(
                  builder: (context) {
                    var width = MediaQuery.of(context).size.width;

                    return SizedBox(
                      width: width - 400,
                      height: 200,
                      child: Column(
                        children: [
                          const Divider(
                            height: 10,
                            thickness: 4,
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
                          dropdownListBuilder(),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: saveButton(index),
                              ),
                              const Expanded(
                                flex: 1,
                                child: SizedBox(width: 1),
                              ),
                              Expanded(
                                flex: 2,
                                child: deleteButton(index),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
          );
          //Navigator.pop(context);
        });
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

  CustomButton deleteButton(int index) {
    print(widget.users[index - 1].id);
    return CustomButton(
      title: 'Delete',
      pressAction: () async {
        await Statics.instance.userController.deleteUser(widget.users[index - 1].id);
      },
    );
  }

  CustomButton saveButton(int index) {
    print(widget.users[index - 1].id);
    return CustomButton(
      title: 'Save',
      pressAction: () async {
        await Statics.instance.userController.putUser(
            widget.users[index - 1].id,
            User(
              id: widget.users[index - 1].id,
              name: widget.users[index - 1].name,
              title: Departments.values.elementAt(userTitleIndex),
              password: widget.users[index - 1].password
            ));
      },
    );
  }

  Center dropdownListBuilder() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Expanded(
          child: DropdownButtonFormField<String>(
            value: titles[userTitleIndex],
            items: titles.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                userTitleIndex = titles.indexOf(newValue!);
              });
            },
            onSaved: (String? newValue) {
              setState(() {
                userTitleIndex = titles.indexOf(newValue!);
              });
            },
          ),
        ),
      ),
    );
  }
}
