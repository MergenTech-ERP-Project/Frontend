import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/services/branch_remote_services.dart';

class BranchController extends GetxController {
  var isLoading = true.obs;
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

  Future<int> fetchBranch(String _branch_name) async {
    try {
      isLoading(true);
      var branch = await BranchRemoteServices.fetchBranch(_branch_name);
      print("fetch Branch: " + branch.toString());
      return branch;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> postBranch(Branch newBranch) async {
    try {
      isLoading(true);
      var response = await BranchRemoteServices.postBranch(
          json.encode(newBranch.toJson()).toString());
      fetchBranches(); //companyList.add(newCompany);
      print("post Branch: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future <String?> putBranch(int id, Branch branch) async {
    try {
      isLoading(true);
      print(id);
      var response = await BranchRemoteServices.putBranch(id, json.encode(branch.toJsonWithId()).toString());
      fetchBranches();
      print("delete Branch: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future <String?> deleteBranch(int id, Branch branch) async {
    try {
      isLoading(true);
      print(id);
      var response = await BranchRemoteServices.deleteBranch(id);
      fetchBranches();
      print("delete Branch: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
