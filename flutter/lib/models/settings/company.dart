import 'dart:convert';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromMap(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Company {
  final int id;
  String companyName;
  String companyPhone;
  String domainName;
  String mersisNo;
  String sgkCompanyNo;

  Company({
    this.id = 0,
    this.companyName = "",
    this.companyPhone = "",
    this.domainName = "",
    this.mersisNo = "",
    this.sgkCompanyNo = "",
  });

  factory Company.fromMap(Map companyMap) {
    return Company(
      id: companyMap['id'],
      companyName: companyMap['company_name'],
      companyPhone: companyMap['company_phone'],
      domainName: companyMap['domain_name'],
      mersisNo: companyMap['mersis_no'],
      sgkCompanyNo: companyMap['sgk_company_no']
    );
  }

  Map toJson() => {
    'company_name': companyName,
    'company_phone': companyPhone,
    'domain_name': domainName,
    'mersis_no': mersisNo,
    'sgk_company_no': sgkCompanyNo,
  };

  Map toJsonWithId() => {
    'id': id,
    'company_name': companyName,
    'company_phone': companyPhone,
    'domain_name': domainName,
    'mersis_no': mersisNo,
    'sgk_company_no': sgkCompanyNo,
  };
}
