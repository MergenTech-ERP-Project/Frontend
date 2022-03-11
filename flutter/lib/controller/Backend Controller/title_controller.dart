// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/services/title_remote_services.dart';

class TitleController extends GetxController {
  var isLoading = false.obs;
  List<Titlee> titleList = <Titlee>[].obs; //List<Company>

  @override
  void onInit() {
    fetchTitles();
    super.onInit();
  }

  void fetchTitles() async {
    try {
      isLoading(true);
      var titles = await TitleRemoteServices.fetchTitles();
      if (titles != null) {
        titleList.assignAll(titleList);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchTitlesById(companyId, branchId, departmentId) async {
    try {
      isLoading(true);
      var titles = await TitleRemoteServices
          .fetchTitleWithCompanyIdAndBranchIdAndDepartmentId(
        companyId,
        branchId,
        departmentId,
      );

      if (titles != null) {
        titleList.assignAll(titles);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String?> newTitle(Titlee newTitle) async {
    try {
      isLoading(true);
      var response = await TitleRemoteServices.newTitle(
          json.encode(newTitle.toJson()).toString());
      fetchTitles(); //companyList.add(newCompany);
      print("New Title: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> updateTitle(int id, Titlee title) async {
    try {
      isLoading(true);
      print(id);
      var response = await TitleRemoteServices.updateTitle(
          id, json.encode(title.toJson()).toString());
      fetchTitles();
      print("Update Title: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> removeTitle(int id) async {
    try {
      isLoading(true);
      print(id);
      var response = await TitleRemoteServices.removeTitle(id);
      fetchTitles();
      print("Remove Title: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
