import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabKisiselBilgilerController extends GetxController {
  DateTime birthDate = DateTime.now();
  int maritalStatusIndex = 0;
  int genderIndex = 0;
  int disabledDegreeIndex = 0;
  int bloodGroupIndex = 0;
  int educationalStatusIndex = 0;
  int highestEducationLevelCompletedIndex = 0;
  int militaryStatusIndex = 0;
  TextEditingController controllerTcNo = TextEditingController();
  TextEditingController controllerNationality = TextEditingController();
  TextEditingController controllerNumberOfKids = TextEditingController();
  TextEditingController controllerEdicationStatus = TextEditingController();
  TextEditingController controllerLastCompletedEducationStatus =
      TextEditingController();
}
