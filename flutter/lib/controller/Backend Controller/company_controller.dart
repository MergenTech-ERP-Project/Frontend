import 'dart:convert';

import 'package:get/get.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/services/settings_company_remote_services.dart';

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

  Future<int> fetchCompany(String _company_name) async {
    try {
      isLoading(true);
      var company = await CompanyRemoteServices.fetchCompany(_company_name);
      print("fetch Company: " + company.toString());
      return company;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> postCompany(String _company_name, String _company_phone,
      String _domain_name, String _mersis_no, String _sgk_company_no) async {
    try {
      isLoading(true);
      Company newCompany = Company(
        id: 0,
        company_name: _company_name,
        company_phone: _company_phone,
        domain_name: _domain_name,
        mersis_no: _mersis_no,
        sgk_company_no: _sgk_company_no,
      );
      var response = await CompanyRemoteServices.postCompany(json.encode(newCompany.toJson()).toString());
      fetchCompanies(); //companyList.add(newCompany);
      print("post Company: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future <String?> putCompany(int id, Company company) async {
    try {
      isLoading(true);
      print(id);
      var response = await CompanyRemoteServices.putCompany(id, json.encode(company.toJsonWithId()).toString());
      fetchCompanies();
      print("delete Company: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }

  Future <String?> deleteCompany(int id, Company company) async {
    try {
      isLoading(true);
      print(id);
      var response = await CompanyRemoteServices.deleteCompany(id);
      fetchCompanies();
      print("delete Company: " + response);
      return response;
    } finally {
      isLoading(false);
    }
  }
}
