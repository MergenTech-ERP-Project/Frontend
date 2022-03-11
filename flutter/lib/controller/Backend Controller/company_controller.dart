// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/services/company_remote_services.dart';

class CompanyController extends GetxController {
  var isLoading = false.obs;
  List<Company> companyList = <Company>[].obs; //List<Company>

  @override
  void onInit() {
    fetchCompanies();
    super.onInit();
  }

  void fetchCompanies() async {
    try {
      isLoading(true);
      var companies = await CompanyRemoteServices.fetchCompanies();
      if (companies != null) {
        companyList.removeRange(0, companyList.length);
        companyList.assignAll(companies);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<int> fetchCompany(String companyName) async {
    try {
      isLoading(true);
      var company = await CompanyRemoteServices.fetchCompany(companyName);
      print("fetch Company: " + company.toString());
      return company;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> newAddCompany(Company newCompany) async {
    try {
      isLoading(true);
      var response = await CompanyRemoteServices.newAddCompany(
        json.encode(newCompany.toJson()).toString(),
      );
      fetchCompanies(); //companyList.add(newCompany);
      print("post Company: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future <String?> updateCompany(int id, Company company) async {
    try {
      isLoading(true);
      print(id);
      var response = await CompanyRemoteServices.updateCompany(
        id,
        json.encode(company.toJsonWithId()).toString(),
      );
      fetchCompanies();
      print("delete Company: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future <String?> removeCompany(int id) async {
    try {
      isLoading(true);
      print(id);
      var response = await CompanyRemoteServices.removeCompany(id);
      fetchCompanies();
      print("delete Company: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
