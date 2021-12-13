import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class ActivityEvaluationPage extends StatefulWidget {
  static String routeName = '/ActivityEvaluationPage';

  const ActivityEvaluationPage({Key? key}) : super(key: key);

  @override
  _ActivityEvaluationPageState createState() => _ActivityEvaluationPageState();
}

class _ActivityEvaluationPageState extends State<ActivityEvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity's Name"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildNameOfOrganizator(),
                    buildDateOfActivity(),
                  ],
                ),
                SizedBox(height: 50),
                buildEvaluation(),
                SizedBox(height: 50),
                Column(
                  children: [
                    buildUsername(),
                    buildButtonSave(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildButtonSave() {
    return Container(
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Text("Save"),
      ),
    );
  }

  Container buildUsername() {
    return Container(
      width: 250,
      child: Text("Username", style: kLabelStyle),
    );
  }

  TextFormField buildEvaluation() {
    return TextFormField(
      maxLines: 15,
      decoration: InputDecoration(
        hintText: "Please, write your thoughts about the event here...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Container buildDateOfActivity() {
    return Container(
      width: 250,
      child: Column(
        children: [
          Text("Date", style: kLabelStyle),
          Text("Tarihi Salla şuan"),
        ],
      ),
    );
  }

  Container buildNameOfOrganizator() {
    return Container(
      width: 250,
      child: Column(
        children: [
          Text("Name", style: kLabelStyle),
          Text("Aktiviteyi Oluşturan Kişi"),
        ],
      ),
    );
  }
}
