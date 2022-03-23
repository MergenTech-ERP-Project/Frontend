class Payment {
  int id;
  String name;
  String salary;
  String unit;
  String description;
  String periot;
  bool grossPrice;
  bool includePayroll;

  Payment({
    this.id = 0,
    required this.name,
    this.salary = "",
    this.unit = "",
    this.description = "",
    this.periot = "",
    this.grossPrice = false,
    this.includePayroll = false,
  });
}
