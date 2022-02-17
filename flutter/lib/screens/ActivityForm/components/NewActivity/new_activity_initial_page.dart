import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class NewActivityInitialPage extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController organizatorController = TextEditingController();
  DateTime date = DateTime.now();

  final _newActivityInitialPageForm = GlobalKey<FormState>();

  final Function() onNextButtonClick;

  NewActivityInitialPage({
    Key? key,
    required this.onNextButtonClick,
  }) : super(key: key);

  @override
  State<NewActivityInitialPage> createState() => _NewActivityInitialPageState();
}

class _NewActivityInitialPageState extends State<NewActivityInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: widget._newActivityInitialPageForm,
          child: Column(
            children: [
              buildTextBox(
                widget.nameController,
                'Name',
                Icons.person,
              ),
              buildTextBox(
                widget.placeController,
                'Place',
                Icons.home,
              ),
              buildTextBox(
                widget.organizatorController,
                'Organizer',
                Icons.person,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  borderless: true,
                  labelText: "Date",
                  onChanged: (val) {
                    if (val != null) {
                      try {
                        widget.date = dateTimeFormat.parse(val);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CustomButton(
          width: double.infinity,
          title: "Create", //next
          pressAction: () {
            if (widget._newActivityInitialPageForm.currentState!.validate()) {
              widget.onNextButtonClick();
              activityController.postActivity(
                  widget.nameController.text,
                  widget.placeController.text,
                  dateTimeFormat.format(widget.date).toString(),
                  widget.organizatorController.text, <User>[]);
              Get.back();
            }
          },
        ),
      ],
    );
  }

  Widget buildTextBox(
      TextEditingController controller, String label, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextBox(
        borderless: true,
        controller: controller,
        suffixWidget: Icon(iconData),
        label: label,
        validator: (val) {
          if (val!.isEmpty) {
            return "Cannot Be Blank";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
