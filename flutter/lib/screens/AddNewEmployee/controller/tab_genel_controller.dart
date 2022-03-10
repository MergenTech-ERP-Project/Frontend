import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabGenelController extends GetxController {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  var controllerEPostaWork = TextEditingController().obs;
  TextEditingController controllerEPostaPersonal = TextEditingController();
  var controllerWorkPhone = TextEditingController().obs;
  TextEditingController controllerTelephonePersonal = TextEditingController();
  TextEditingController controllerAccessType = TextEditingController();
  TextEditingController controllerContractEndDate = TextEditingController();
}
