import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class NewActivityPage extends StatefulWidget {
  static String routeName = '/NewActivityPage';

  NewActivityPage({Key? key}) : super(key: key);

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  final _newActivityKey = GlobalKey<FormState>();

  final TextEditingController _activityNameController = TextEditingController();
  final TextEditingController _activityPlaceController = TextEditingController();
  final TextEditingController _activityDateTimeController = TextEditingController();
  final TextEditingController _activityOrganizatorController = TextEditingController();

  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var ratio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(Statics.instance.userController.userList[Statics.instance.userId].name)),
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
                  buildTextBox(_activityNameController, 'Name', "Name"),
                  const SizedBox(height: 20),
                  buildTextBox(_activityPlaceController, 'Place', 'Place'),
                  const SizedBox(height: 20),
                  buildDatePicker(_activityDateTimeController),
                  const SizedBox(height: 20),
                  buildTextBox(_activityOrganizatorController, 'Organizer', 'Organizer'),
                  const SizedBox(height: 20),
                  createButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  CustomButton createButton(BuildContext context) {
    return CustomButton(
      title: "Create",
      pressAction: () {
        setState(() {
          var response = Statics.instance.activityController.postActivity(
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
    );
  }

  CustomTextBox buildTextBox(TextEditingController controller, String title, String label) {
    return CustomTextBox(
      controller: controller,
      title: title,
      label: label,
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else {
          return null;
        }
      },
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
