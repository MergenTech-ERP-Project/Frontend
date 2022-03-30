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
    fetchDepartments();
    super.onInit();
  }

  void fetchDepartments() async {
    try {
      isLoading(true);
      var departments = await DepartmentRemoteServices.fetchDepartments();
      if (departments != null) {
        departmentList.assignAll(departments);
      }
    } finally {
      isLoading(false);
    }
  }

  fetchDepartmentsByBranchId(int branchId) async {
    try {
      isLoading(true);
      var departmants =
          await DepartmentRemoteServices.fetchDepartmentsByBranchId(branchId);
      if (departmants != null) {
        departmentList.removeRange(0, departmentList.length);
        departmentList.assignAll(departmants);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String?> newDepartment(Department newDepartment, int branchId) async {
    try {
      isLoading(true);
      var response = await DepartmentRemoteServices.addNewDepartment(
          json.encode(newDepartment.toJson()).toString());
      fetchDepartmentsByBranchId(branchId);
      print("New Department: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateDepartment(
      int id, Department department, int branchId) async {
    try {
      isLoading(true);
      print(id);
      var response = await DepartmentRemoteServices.updateDepartment(
          id, json.encode(department.toJson()).toString());
      fetchDepartmentsByBranchId(branchId);
      print("Update Department: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> removeDepartment(int id) async {
    try {
      isLoading(true);
      print(id);
      var response = await DepartmentRemoteServices.removeDepartment(id);
      fetchDepartmentsByBranchId(id);
      print("Remove Department: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
