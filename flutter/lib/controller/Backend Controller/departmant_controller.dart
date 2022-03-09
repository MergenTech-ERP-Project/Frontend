// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/services/department_remote_services.dart';

class DepartmentController extends GetxController {
  var isLoading = false.obs;
  List<Department> departmentList = <Department>[].obs; //List<Company>

  @override
  void onInit() {
    //fetchDepartments();
    super.onInit();
  }

  void fetchDepartments() async {
    try {
      isLoading(true);
      var departments = await DepartmentRemoteServices.fetchDepartments();
      if (departments != null) {
        departmentList.removeRange(0, departmentList.length);
        departmentList.assignAll(departments);
      }
    } finally {
      isLoading(false);
    }
  }

  /* void fetchDepartmentesById(int companyId, int branchId) async {
    try {
      isLoading(true);
      var departments = await DepartmentRemoteServices.fetchDepartmentsById(
          companyId, branchId);
      if (departments != null) {
        departmentList.removeRange(0, departmentList.length);
        departmentList.assignAll(departments);
      }
    } finally {
      isLoading(false);
    }
  } */

  Future<String?> postDepartment(Department newDepartment) async {
    try {
      isLoading(true);
      var response = await DepartmentRemoteServices.postDepartment(
          json.encode(newDepartment.toJson()).toString());
      fetchDepartments(); //companyList.add(newCompany);
      print("New Department: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> putDepartment(int id, Department department) async {
    try {
      isLoading(true);
      print(id);
      var response = await DepartmentRemoteServices.putDepartment(
          id, json.encode(department.toJsonWithId()).toString());
      fetchDepartments();
      print("Update Department: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> deleteDepartment(int id, Department department) async {
    try {
      isLoading(true);
      print(id);
      var response = await DepartmentRemoteServices.deleteDepartment(id);
      fetchDepartments();
      print("Remove Department: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
