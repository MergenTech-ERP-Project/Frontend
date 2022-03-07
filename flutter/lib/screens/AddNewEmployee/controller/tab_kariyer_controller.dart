import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabKariyerController extends GetxController {
  TextEditingController positionSirket = TextEditingController();
  TextEditingController positionSube = TextEditingController();
  TextEditingController positionDepartman = TextEditingController();
  TextEditingController positionUnvan = TextEditingController();
  TextEditingController positionYoneticisi = TextEditingController();
  TextEditingController positionCalismaSekli = TextEditingController();
  TextEditingController controllerSalary = TextEditingController();
  TextEditingController controllerUnit = TextEditingController();
  TextEditingController controllerPaymentScreenInSalary =
      TextEditingController();

  DateTime positionDateTimeBaslangic = DateTime.now();
  DateTime positionDateTimeBitis = DateTime.now();
  DateTime gecerlilikBaslangic = DateTime.now();
}
