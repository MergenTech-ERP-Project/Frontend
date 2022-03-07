import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabGenelController extends GetxController {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerEPostaWork = TextEditingController();
  TextEditingController controllerEPostaPersonal = TextEditingController();
  TextEditingController controllerWorkPhone = TextEditingController();
  TextEditingController controllerTelephonePersonal = TextEditingController();
  TextEditingController controllerAccessType = TextEditingController();
  TextEditingController controllerContractEndDate = TextEditingController();

  int contractTypeIndex = 0;
  int employmentTypeIndex = 0;


  DateTime dateOfStart = DateTime.now();
  DateTime contractEndDate = DateTime.now();
}
