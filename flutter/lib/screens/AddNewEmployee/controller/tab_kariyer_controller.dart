import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabKariyerController extends GetxController {
  TextEditingController positionUnvan = TextEditingController();
  TextEditingController positionYoneticisi = TextEditingController();
  TextEditingController positionCalismaSekli = TextEditingController();
  TextEditingController controllerSalary = TextEditingController();
  TextEditingController controllerUnit = TextEditingController();
  TextEditingController controllerPaymentScreenInSalary =
      TextEditingController();

  var unitCompanyIndex = 0.obs;
  var unitBranchIndex = 0.obs;
  var unitDepartmantIndex = 0.obs;
  var unitTitleIndex = 0.obs;
}
