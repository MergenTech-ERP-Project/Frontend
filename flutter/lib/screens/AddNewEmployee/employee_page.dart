// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_diger_bilgiler.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_diger_bilgiler_small.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_genel.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kisisel_bilgiler.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/tab_kisisel_bilgiler_small.dart';
import 'package:vtys_kalite/utilities/style.dart';

class EmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          automaticallyImplyLeading: true,
          backgroundColor: lightColor,
          foregroundColor: blackColor,
          bottom: TabBar(
            tabs: [
              Tab(
                child: CustomText(
                  text: 'Genel',
                  color: blackColor,
                ),
              ),
              Tab(
                child: CustomText(
                  text: 'Kişisel Bilgiler',
                  color: blackColor,
                ),
              ),
              Tab(
                child: CustomText(
                  text: 'Diğer Bilgiler',
                  color: blackColor,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          TabGenel(),
          ResponsiveWidget(
            largeScreen: TabPersonalInformation(),
            smallScreen: TabPersonalInformationSmall(),
          ),
          ResponsiveWidget(
            largeScreen: TabAnotherInformation(),
            smallScreen: TabAnotherInformationSmall(),
          ),
        ]),
      ),
    );
  }
}
