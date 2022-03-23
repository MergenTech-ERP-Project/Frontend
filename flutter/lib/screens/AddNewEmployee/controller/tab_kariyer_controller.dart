import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabKariyerController extends GetxController {
  ///Career
  TextEditingController positionUnvan = TextEditingController();
  TextEditingController positionYoneticisi = TextEditingController();
  TextEditingController positionCalismaSekli = TextEditingController();

  ///Payment
  TextEditingController controllerPaymentName = TextEditingController();
  TextEditingController controllerPaymentSalary = TextEditingController();
  TextEditingController controllerPaymentUnit = TextEditingController();
  TextEditingController controllerPaymentDescription = TextEditingController();
  TextEditingController controllerPaymentPeriot = TextEditingController();

  var unitCompanyIndex = 0.obs;
  var unitBranchIndex = 0.obs;
  var unitDepartmantIndex = 0.obs;
  var unitTitleIndex = 0.obs;
}
