import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/screens/ActivityForm/main_form_page.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_diger_bilgiler.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_genel.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kariyer.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kisisel_bilgiler.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class AddNewEmployee extends StatefulWidget {
  static String routeName = '/AddNewEmployee';

  AddNewEmployee({Key? key}) : super(key: key);

  bool isSaved = false;

  @override
  _AddNewEmployeeState createState() => _AddNewEmployeeState();
}

class _AddNewEmployeeState extends State<AddNewEmployee> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text("Employee"),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pushReplacementNamed(context, MainFormPage.routeName);
            },
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            tabs: [
              const Tab(text: 'Genel'),
              const Tab(text: 'Kariyer'),
              const Tab(text: 'Kişisel Bilgiler'),
              const Tab(text: 'Diğer Bilgiler'),
              const Tab(text: 'İzin'),
              const Tab(text: 'Ödemeler'),
              const Tab(text: 'Mesai'),
              const Tab(text: 'Bodro'),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Diğer"),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    const TabGenel(),
                    TabKariyer(),
                    TabPersonalInformation(),
                    TabAnotherInformation(),
                    const Center(child: Text("4")),
                    const Center(child: Text("5")),
                    const Center(child: Text("6")),
                    const Center(child: Text("7")),
                    const Center(child: Text("8")),
                  ],
                ),
              ),
              Container(
                height: 60,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(""),
                    ),
                    Expanded(
                      child: Visibility(
                        visible: widget.isSaved,
                        child: Row(
                          children: const [
                            Icon(Icons.done),
                            Text(' Saved'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        title: 'Save',
                        pressAction: () {
                          setState(() {
                            widget.isSaved = true;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        title: 'Cancel',
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        pressAction: () {
                          Navigator.pushReplacementNamed(
                              context, MainFormPage.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
