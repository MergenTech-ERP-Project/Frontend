import 'dart:convert';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromMap(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Company {
  final int id;
  String company_name;
  String company_phone;
  String domain_name;
  String mersis_no;
  String sgk_company_no;

  Company({
    this.id = 0,
    this.company_name = "",
    this.company_phone = "",
    this.domain_name = "",
    this.mersis_no = "",
    this.sgk_company_no = "",
  });

  factory Company.fromMap(Map companyMap) {
    return Company(
      id: companyMap['id'],
      company_name: companyMap['company_name'],
      company_phone: companyMap['company_phone'],
      domain_name: companyMap['domain_name'],
      mersis_no: companyMap['mersis_no'],
      sgk_company_no: companyMap['sgk_company_no']
    );
  }

  Map toJson() => {
    'company_name': company_name,
    'company_phone': company_phone,
    'domain_name': domain_name,
    'mersis_no': mersis_no,
    'sgk_company_no': sgk_company_no,
  };

  Map toJsonWithId() => {
    'id': id,
    'company_name': company_name,
    'company_phone': company_phone,
    'domain_name': domain_name,
    'mersis_no': mersis_no,
    'sgk_company_no': sgk_company_no,
  };
}
