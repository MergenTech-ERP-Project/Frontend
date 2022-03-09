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

  int unitCompanyIndex = 0;
  int unitBranchIndex = 0;
  int unitDepartmantIndex = 0;
  int unitTitleIndex = 0;
}
