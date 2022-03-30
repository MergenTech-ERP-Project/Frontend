// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_animated_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/helpers/local_navigator.dart';
import 'package:vtys_kalite/routing/router.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/site_layout.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AddNewEmployee extends StatelessWidget {
  String id = Get.parameters['userId'].toString();

  @override
  Widget build(BuildContext context) {
    print(id);
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 10)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: lightColor,
            child: const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: SingleChildScrollView(),
              ),
            ),
          );
        } else {
          return id != "new"
              ? _UpdatePage(userId: int.parse(id))
              : _CreatePage();
        }
      },
    );
  }
}

class _UpdatePage extends StatelessWidget {
  final int userId;

  _UpdatePage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      items: employeeSideMenuItems,
      navigator: Stack(
        children: [
          _FutureBody(userId: userId),
          Positioned(
            bottom: 10,
            right: 10,
            child: CustomHoverAnimatedButton(
              primaryColor: greenColor,
              secondaryColor: whiteColor,
              height: 50,
              width: 120,
              text: "Kaydet",
              onTap: () async {
                showDialogWaitingMessage(context);
                await userHelper.userDetailSave(index: 0);
                await userHelper.userDetailSave(index: 1);
                Navigator.of(context).pop(true);
              },
            ),
          ),
        ],
      ),
      trailingWidget: InkWell(
        onTap: () {
          Get.offAllNamed(rootRoute);
        },
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(Icons.close, size: 24),
        ),
      ),
    );
  }
}

class _CreatePage extends StatelessWidget {
  int pageIndex = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Form(
              key: _formKey,
              child: const _FutureBody(userId: -1),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: CustomHoverAnimatedButton(
              primaryColor: greenColor,
              secondaryColor: whiteColor,
              height: 50,
              width: pageIndex == 1 ? 120 : 150,
              text: pageIndex == 1 ? "Kaydet" : "Sonraki",
              icon: pageIndex == 1 ? Icons.keyboard_arrow_right : null,
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await userHelper.userDetailSave(index: pageIndex);
                  pageIndex++;
                  menuController.setActiveItem(
                    employeeSideMenuItems[pageIndex].name,
                  );
                  await navigatorController.navigateTo(
                    employeeSideMenuItems[pageIndex].route,
                  );
                }
                if (pageIndex == 1) {
                  Get.offAllNamed(rootRoute);
                }
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () => Get.offAllNamed(rootRoute),
              child: const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.close,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FutureBody extends StatelessWidget {
  final int userId;

  const _FutureBody({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userHelper.init(id: userId),
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return Container(
            color: lightColor,
            child: const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          if (snap.hasError) {
            return Container(
              color: redColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: CustomText(
                      text: snap.error.toString(),
                      size: 24,
                      color: yellowColor,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const LocalNavigator(
              initialRoute: employeePageRoute,
              generateRoute: employeeGenerateRoute,
            );
          }
        }
      },
    );
  }
}
