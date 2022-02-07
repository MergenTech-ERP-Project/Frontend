import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_genel.dart';

class AddNewEmployee extends StatefulWidget {
  const AddNewEmployee({Key? key}) : super(key: key);

  @override
  _AddNewEmployeeState createState() => _AddNewEmployeeState();
}

class _AddNewEmployeeState extends State<AddNewEmployee> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          //automaticallyImplyLeading: true, //geri butonunu kaldırma
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Genel'),
              Tab(text: 'Kariyer'),
              Tab(text: 'Kişisel Bilgiler'),
              Tab(text: 'İzin'),
              Tab(text: 'Ödemeler'),
              Tab(text: 'Mesai'),
              Tab(text: 'Bodro'),
              Tab(text: 'Diğer'),
            ],
          ),
        ),
        body: const SafeArea(
            child: TabBarView(
              children: [
                TabGenel(),
                Center(child: Text("2")),
                Center(child: Text("3")),
                Center(child: Text("4")),
                Center(child: Text("5")),
                Center(child: Text("6")),
                Center(child: Text("7")),
                Center(child: Text("8")),
              ],
            )),
      ),
    );
  }
}
