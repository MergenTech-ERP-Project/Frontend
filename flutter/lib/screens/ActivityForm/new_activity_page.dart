import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/ListUsers/list_users.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class NewActivityPage extends StatefulWidget {
  static String routeName = '/NewActivityPage';

  NewActivityPage({Key? key}) : super(key: key);

  List<User> selectedUsers = <User>[].obs;

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  final _newActivityKey = GlobalKey<FormState>();

  final TextEditingController _activityNameController = TextEditingController();
  final TextEditingController _activityPlaceController =
      TextEditingController();
  final TextEditingController _activityDateTimeController =
      TextEditingController();
  final TextEditingController _activityOrganizatorController =
      TextEditingController();

  DateTime _date = DateTime.now();
  final controller = PageController(viewportFraction: 0.8, keepPage: true,initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _activityOrganizatorController.text =
        Statics.instance.userController.userList[Statics.instance.userId].name;
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(Statics
            .instance.userController.userList[Statics.instance.userId].name)),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Flexible(
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Form(
                          key: _newActivityKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                buildTextBox(_activityNameController, 'Name', 'Name'),
                                buildTextBox(
                                    _activityPlaceController, 'Place', 'Place'),
                                buildDatePicker(_activityDateTimeController),
                                buildTextBox(_activityOrganizatorController,
                                    'Organizer', 'Organizer'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            const Expanded(flex: 1, child: Text("")),
                            const Expanded(flex: 1, child: Text("")),
                            Expanded(flex: 1,child: nextButton(controller)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width / 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(flex: 8, child: ListUsers(selectedUsers: widget.selectedUsers)),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: previousButton(controller)),
                            const Expanded(flex: 1, child: Text("")),
                            Expanded(flex: 1,child: nextButton(controller)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            const Text("Ready!"),
                            createButton(context),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: previousButton(controller)),
                            const Expanded(flex: 1, child: Text("")),
                            const Expanded(flex: 1,child: Text("")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //floatingActionButton:
    );
  }

  CustomButton nextButton(PageController controller) {
    return CustomButton(
      title: 'Next',
      pressAction: () {
        controller.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      },
    );
  }

  CustomButton previousButton(PageController controller) {
    return CustomButton(
      title: 'Previous',
      pressAction: () {
        controller.previousPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      },
    );
  }

  CustomButton createButton(BuildContext context) {
    return CustomButton(
      title: "Create",
      pressAction: () {
        setState(() {
          if (!_newActivityKey.currentState!.validate() ||
              widget.selectedUsers.isEmpty) return;
          var response = Statics.instance.activityController.postActivity(
              _activityNameController.text,
              _activityPlaceController.text,
              dateTimeFormat.format(_date).toString(),
              _activityOrganizatorController.text);
          print(response);
          Navigator.pop(context);
        });
      },
    );
  }

  CustomTextBox buildTextBox(
      TextEditingController controller, String title, String hint) {
    return CustomTextBox(
      controller: controller,
      title: title,
      hint: hint,
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else {
          return null;
        }
      },
    );
  }

  Column buildDatePicker(TextEditingController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Date", style: kLabelStyle),
        const SizedBox(height: 10),
        DateTimePicker(
          type: DateTimePickerType.dateTime,
          initialDate: _date,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          decoration: InputDecoration(
            labelText: "Date - Time",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (value) => {_date = value as DateTime},
        ),
      ],
    );
  }
}
