import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_diger_bilgiler.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_genel.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kariyer.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kisisel_bilgiler.dart';

class AddNewEmployee extends StatefulWidget {
  const AddNewEmployee({Key? key}) : super(key: key);

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
          //automaticallyImplyLeading: true, //geri butonunu kaldırma
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Genel'),
              Tab(text: 'Kariyer'),
              Tab(text: 'Kişisel Bilgiler'),
              Tab(text: 'Diğer Bilgiler'),
              Tab(text: 'İzin'),
              Tab(text: 'Ödemeler'),
              Tab(text: 'Mesai'),
              Tab(text: 'Bodro'),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Diğer"),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              TabGenel(),
              TabKariyer(),
              TabPersonalInformation(),
              TabAnotherInformation(),
              Center(child: Text("4")),
              Center(child: Text("5")),
              Center(child: Text("6")),
              Center(child: Text("7")),
              Center(child: Text("8")),
            ],
          ),
        ),
      ),
    );
  }
}