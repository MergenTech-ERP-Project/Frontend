// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/services/branch_remote_services.dart';

class BranchController extends GetxController {
  var isLoading = false.obs;
  List<Branch> branchList = <Branch>[].obs; //List<Company>

  @override
  void onInit() {
    fetchBranches();

    super.onInit();
  }

  void fetchBranches() async {
    try {
      isLoading(true);
      var branches = await BranchRemoteServices.fetchBranches();
      if (branches != null) {
        branchList.removeRange(0, branchList.length);
        branchList.assignAll(branches);
      }
    } finally {
      isLoading(false);
    }
  }

  fetchBranchesByCompanyId(int companyId) async {
    try {
      isLoading(true);
      var branches =
          await BranchRemoteServices.fetchBranchesByCompanyId(companyId);
      if (branches != null) {
        branchList.removeRange(0, branchList.length);
        branchList.assignAll(branches);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String?> addNewBranch(Branch newBranch, int companyId) async {
    try {
      isLoading(true);
      var response = await BranchRemoteServices.newAddBranch(
          json.encode(newBranch.toJson()).toString());
      //fetchBranches(); //companyList.add(newCompany);
      fetchBranchesByCompanyId(companyId);
      print("post Branch: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateBranch(int id, Branch branch, int companyId) async {
    try {
      isLoading(true);
      print(id);
      var response = await BranchRemoteServices.updateBranch(
          id, json.encode(branch.toJson()).toString());
      fetchBranchesByCompanyId(companyId);
      print("update Branch: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> removeBranch(int id, int companyId) async {
    try {
      isLoading(true);
      print(id);
      var response = await BranchRemoteServices.removeBranch(id);
      fetchBranchesByCompanyId(companyId);
      print("delete Branch: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
