import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:vtys_kalite/controller/activity_controller.dart';
import 'package:vtys_kalite/controller/activity_evaluation_controller.dart';
import 'package:vtys_kalite/controller/user_controller.dart';
import 'package:vtys_kalite/screens/ActivityForm/activity_form.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class NewActivityPage extends StatefulWidget {
  static String routeName = '/NewActivityPage';

  NewActivityPage({Key? key}) : super(key: key);

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  final _newActivityKey = GlobalKey<FormState>();
  static int universal = 0;

  final UserController userController = Get.put(UserController());
  final ActivityController activityController = Get.put(ActivityController());
  final ActivityEvaluationController activityEvaluationController =
      Get.put(ActivityEvaluationController());

  final TextEditingController _activityNameController = TextEditingController();
  final TextEditingController _activityPlaceController = TextEditingController();
  final TextEditingController _activityDateTimeController = TextEditingController();
  final TextEditingController _activityOrganizatorController = TextEditingController();

  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    universal = ModalRoute.of(context)!.settings.arguments as int;
    var screenSize = MediaQuery.of(context).size;
    var ratio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(userController.userList[universal].name)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenSize.width < 600/ratio ? screenSize.width * 0.5 : 500/ratio,
            height: screenSize.height < 800/ratio ? screenSize.height * 0.5 : 700/ratio,
            child: Form(
              key: _newActivityKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Activity", style: kLabelHeaderStyle),
                  const SizedBox(height: 20),
                  buildTextFormField(_activityNameController, 'Name'),
                  const SizedBox(height: 20),
                  buildTextFormField(_activityPlaceController, 'Place'),
                  const SizedBox(height: 20),
                  buildDatePicker(_activityDateTimeController),
                  const SizedBox(height: 20),
                  buildTextFormField(_activityOrganizatorController, 'Organizer'),
                  const SizedBox(height: 20),
                  buildCreateButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildCreateButton() {
    return Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var response = activityController.postActivity(
                        _activityNameController.text,
                        _activityPlaceController.text,
                        dateFormat.format(_date).toString(),
                        _activityOrganizatorController.text
                      );
                      print(response);
                      if (_newActivityKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    });
                  },
                  style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: const Text("Create"),
                ),
              );
  }

  TextFormField buildTextFormField(TextEditingController controller, String labelText) {
    return TextFormField(
                controller: controller,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Cannot Be Blank";
                  }
                },
                decoration: InputDecoration(
                  labelText: labelText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
  }
  DateTimePicker buildDatePicker(TextEditingController controller) {
    return DateTimePicker(
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
    );
  }
}
